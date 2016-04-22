class GradesMailer < ApplicationMailer
	def send_grades(student, exam)
		@grades = student.exams.where(exam_id: exam.id).grades
	end
end
