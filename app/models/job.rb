class Job
  include Mongoid::Document
  field :images, type: Array

  belongs_to :question
  belongs_to :student
  belongs_to :teacher
  belongs_to :exam
  belongs_to :course

  def next(teacher_id)
    self.class.where(:teacher_id => teacher_id).where(:_id.gt => self._id).order_by(:question_id => 'asce').limit(1).first
  end

  def previous(teacher_id)
    self.class.where(:teacher_id => teacher_id).where(:_id.lt => self._id).order_by(:question_id => 'asce').limit(1).first
  end
end
