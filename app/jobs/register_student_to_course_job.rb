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
      @student = Student.find_by(email: student[:email]) || Student.create!(name: student[:name],
                                                                            roll: student[:roll],
                                                                            email: student[:email],
                                                                            password: "password")

      StudentRegistration.delay(run_at: 1.minutes.from_now).send_enrollment_notification(@student, course)
      course.students << @student
    end
    return course.students.count
  end
end
