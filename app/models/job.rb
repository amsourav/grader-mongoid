class Job
  include Mongoid::Document
  include Mongoid::Timestamps

  

  belongs_to :teacher
  belongs_to :exam
  
end
