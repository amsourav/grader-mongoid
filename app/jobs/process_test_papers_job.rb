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
  	portrait_pages = document.pages.select{ |page| true }

    # Incomplete

  end
end
