class Job
  include Mongoid::Document
  include Mongoid::Timestamps

  # field :question_tag, type: String
  # field :page, type: Integer
  # field :max_mark, type: Integer
  field :file, type: String
  belongs_to :teacher
  belongs_to :exam
  belongs_to :student
  belongs_to :questionpaperspec
  has_one :grade


  def next(teacher_id)
    self.class.where(:teacher_id => teacher_id).where(:_id.gt => self._id).order_by([[:_id, :asc]]).limit(1).first
  end

  def previous(teacher_id)
    self.class.where(:teacher_id => teacher_id).where(:_id.lt => self._id).order_by([[:_id, :desc]]).limit(1).first
  end

end
