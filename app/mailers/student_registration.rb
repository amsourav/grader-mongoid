class StudentRegistration < ApplicationMailer
	def send_details(student)
		@student = student
		mail(to: @student.email, subject: 'Enrolled in subject!')
	end
end
