class StudentRegistration < ApplicationMailer
	# def send_details(student)
	# 	@student = student
	# 	mail(to: @student.email, subject: 'Enrolled in subject!')
	# end

	def send_enrollment_notification(student, course)
		@student = student
		@course = course
		mail(to: @student.email, subject: "Enrolled in: #{@course.code}")
	end

	def exam_reminder(student, exam)
		@student = student
		@exam = exam
		mail(to: @student.email, subject: "You have an upcoming Exam")
	end

	def send_password(student, password)
		@student = student
		@password = password
	end
end
