class RegisterStudentToCourseJob < ActiveJob::Base
  queue_as :default

  def perform(file_path, course)
    options = {:user_provided_headers => ["roll", "name", "email"], :headers_in_file => false }
    student_file = SmarterCSV.process(file_path, options)
    student_file.each do |student|
      # USE ROLL
      @student = Student.find_by(email: student[:email]) || Student.create!(name: student[:name], roll: student[:roll], email: student[:email], password: "password")
      course.students << @student
    end
  end
end
