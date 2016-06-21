class RegisterStudentToCourseJob < ActiveJob::Base
  queue_as :default

  def perform(file_path, course)
    options = {:user_provided_headers => ["roll", "name", "email"], :headers_in_file => false }
    student_file = SmarterCSV.process(file_path, options)
    student_file.each do |student|
      # USE ROLL
      # @student = Student.find_by(email: student[:email])
      # if @student
      #   StudentRegistration.send_enrollment_notification(@student, course).deliver
      #   course.students << @student
      # else
      #   @student = Student.create!(name: student[:name],
      #                   roll: student[:roll],
      #                   email: student[:email],
      #                   password: 'password')
      #   StudentRegistration.send_enrollment_notification(@student, course).deliver
      #   course.students << @student
      # end
      generated_password = Devise.friendly_token.first(8)
      @student = Student.find_by(email: student[:email]) || Student.create!(name: student[:name],
                                                                            roll: student[:roll],
                                                                            email: student[:email],
                                                                            password: generated_password)

      StudentRegistration.delay.send_enrollment_notification(@student, course)
      course.students << @student
    end
    return course.students.count
  end
end
