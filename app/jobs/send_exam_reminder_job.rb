class SendExamReminderJob < ActiveJob::Base
  queue_as :default

  def perform(students, exam)
    students.each do |student|
      StudentRegistration.delay.exam_reminder(student, exam)
    end
  end
end
