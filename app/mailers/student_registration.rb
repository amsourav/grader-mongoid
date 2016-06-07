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
end
