class HandleFileConversionJob < ActiveJob::Base
  def self.perform(doc, qspecs, students, exam_id)
    no_of_students = students.length
    no_of_ques = qspecs.length
  	document = PDFShaver::Document.new(doc)
  	dir = File.dirname(doc)
  	portrait_pages = document.pages.select{ |page| page.aspect < 1 }
    for i in 1..no_of_students
      var = no_of_ques*(i-1)
      for j in 1..no_of_ques
        page = portrait_pages[var]
        dimensions = page.extract_dimensions_from_gm_geometry_string('800x')
        out_path = File.join(dir,"#{students[i-1].roll}_#{j}.jpg")
        page.render(out_path, dimensions)

        Job.create!(file: out_path, student_roll: students[i-1].roll, student_name: students[i-1].name, teacher_id: qspecs[j-1].teacher_id, exam_id: exam_id)

        var = var + 1
      end
    end  
  end
end
