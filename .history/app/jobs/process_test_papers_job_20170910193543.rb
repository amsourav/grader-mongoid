class ProcessTestPapersJob < ActiveJob::Base
  queue_as :default
  def perform(exam)
    students = exam.test_givers
    questions = exam.questions

    no_of_pages_per_student = questions.pluck(:pages).sum
    debugger
    total_no_of_pages = students.length * no_of_pages_per_student
    document = PDFShaver::Document.new(exam.test_papers.file.path)
    dir = File.dirname(exam.test_papers.file.path)
  	pages = document.pages.select{ |page| true }

    # I dont know what I did here, but this shit is working after 2 months of intense
    # head-banging and hair-pulling. Please someone optimize this shit.

    pages = pages[0..total_no_of_pages-1]

    split_images = []

    pages.each do |page|
      # 800x seems okay enough
      dimensions = page.extract_dimensions_from_gm_geometry_string('800x')
      # Hiding files like a boss
      out_path = File.join(dir,"#{page.index}_#{Digest::SHA1.hexdigest((rand(12123123423) * Time.now.to_i).to_s)}.jpg")
      page.render(out_path, dimensions)
      split_images << out_path.split('/public')[1]
    end


    var = 0
    students.each do |student|
      exam_sheet_group = split_images[var..(var+no_of_pages_per_student-1)]
      q_var = 0
      questions.each do |question|
        question_exam_sheet_group = exam_sheet_group[q_var..(q_var+question.pages-1)]
        Job.create!(teacher_id: question.teacher.id,
          student_id: student.id,
          question_id: question.id,
          exam_id: exam.id,
          course_id: exam.course.id,
          images: question_exam_sheet_group
        )
        q_var = q_var+question.pages
      end
      var = var+no_of_pages_per_student
    end
    # Shit ends
  end
end
