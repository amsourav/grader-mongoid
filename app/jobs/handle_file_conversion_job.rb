class HandleFileConversionJob < ActiveJob::Base
  def self.perform(doc, course, exam)

    students = course.students
    qspec = exam.questionpaperspecs
    no_of_students = students.length
    no_of_ques = qspec.length
    no_of_pages = exam.page_size
    pages_per_student = no_of_students / no_of_pages

  	document = PDFShaver::Document.new(doc.file.path)
  	dir = File.dirname(doc.file.path)
  	portrait_pages = document.pages.select{ |page| true } # select all pages regardless of aspect ratio || page.aspect < 1

    for i in 1..no_of_students
      var = no_of_ques*(i-1)
      for j in 1..no_of_ques
        page = portrait_pages[var]
        dimensions = page.extract_dimensions_from_gm_geometry_string('800x')
        out_path = File.join(dir,"#{j}_#{students[i-1].roll}.jpg")
        page.render(out_path, dimensions)
        # # Job Creation
        #  Job.create!(max_mark: qspecs[j-1].marks, 
        #     page: qspecs[j-1].page, question_tag: qspecs[j-1].tag, 
        #     file: out_path.split('/public')[1], student_roll: students[i-1].roll, 
        #     student_name: students[i-1].name, teacher_id: qspecs[j-1].teacher_id, 
        #     exam_id: exam_id)
        Job.create!(questionpaperspec_id: qspec[j-1].id, 
          teacher_id: qspec[j-1].teacher.id,
          student_id: students[i-1].id,
          exam_id: qspec[j-1].exam.id,
          file: out_path.split('/public')[1]
        )
        var = var + 1
      end
    end
  end
end
