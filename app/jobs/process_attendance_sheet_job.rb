class ProcessAttendanceSheetJob < ActiveJob::Base
  queue_as :default

  def perform(exam)
    options = {:user_provided_headers => ["roll", "name", "email"], :headers_in_file => false }
    file_path = exam.attendance_sheet.path
    student_file = SmarterCSV.process(file_path, options)
    course = exam.course
    student_file.each do |student|
      check_student = course.students.find_by(email: student[:email])
      if !check_student.nil?
        exam.test_givers << check_student
      end
    end
    exam.save!
  end
end
