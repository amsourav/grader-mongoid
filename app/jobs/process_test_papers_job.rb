class ProcessTestPapersJob < ActiveJob::Base
  queue_as :default

  def perform(exam)
    #byebug
  end
end
