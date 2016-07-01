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


    # @page_shift = 0
    # students.each do |student|
    #   (0..(no_of_pages_per_student-1)).each do |k|
    #     pages[@page_shift..no_of_pages_per_student-1].each do |page|
    #       dimensions = page.extract_dimensions_from_gm_geometry_string('1000x')
    #       out_path = File.join(dir,"#{student.roll}_#{k}.jpg")
    #       page.render(out_path, dimensions)
    #     end
    #     @page_shift = (@page_shift + no_of_pages_per_student)
    #   end
    # end

    

    # debugger
    #   page_shift = 0
    #   students.each do |student|
    #     questions.each do |question|
    #         pages_subset = pages[page_shift..(page_shift + no_of_pages_per_student)-1]
    #         k = 0
    #         if pages_subset == nil
    #           break
    #         end
    #         pages_subset.each do |page|
    #           dimensions = page.extract_dimensions_from_gm_geometry_string('1000x')
    #           out_path = File.join(dir,"#{student.roll}_#{k}.jpg")
    #           page.render(out_path, dimensions)
    #           k = k + 1
    #         end
    #         page_shift = (page_shift + no_of_pages_per_student)
    #     end
    #   end
  end
end
