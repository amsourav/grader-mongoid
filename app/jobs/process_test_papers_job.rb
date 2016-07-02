class ProcessTestPapersJob < ActiveJob::Base
  queue_as :default

  def perform(exam)
    students = exam.test_givers
    questions = exam.questions

    no_of_students = students.length
    no_of_question = questions.length

    no_of_pages_per_student = questions.pluck(:pages).sum
    total_no_of_pages = no_of_pages_per_student * no_of_students

    document = PDFShaver::Document.new(exam.test_papers.file.path)
    dir = File.dirname(exam.test_papers.file.path)
  	pages = document.pages.select{ |page| true }

    pages = pages[0..total_no_of_pages-1]

    split_images = []

    pages.each do |page|
      dimensions = page.extract_dimensions_from_gm_geometry_string('800x')
      out_path = File.join(dir,"#{page.index}_#{Digest::SHA1.hexdigest((rand(12123123423) * Time.now.to_i).to_s)}.jpg")
      page.render(out_path, dimensions)
      split_images << out_path
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
          images: question_exam_sheet_group
        )
        q_var = q_var+question.pages
      end
      var = var+no_of_pages_per_student
    end
  end
end