class Job
  include Mongoid::Document
<<<<<<< HEAD
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

=======
  field :images, type: Array

  belongs_to :question
  belongs_to :student
  belongs_to :teacher
  belongs_to :exam
  belongs_to :course

  has_one :grade

  def next(teacher_id, exam_id)
    links = self.link_array(teacher_id, exam_id)
    current_index = links.index(self.id)
    return links[current_index + 1]
  end

  def previous(teacher_id, exam_id)
    links = self.link_array(teacher_id, exam_id)
    current_index = links.index(self.id)
    if current_index == 0
      return nil
    else
      return links[current_index - 1]
    end
  end

  def link_array(teacher_id, exam_id)
    self.class.where(teacher_id: teacher.id).where(exam_id: exam_id).
          order_by(:question_id => 'asce').pluck(:id)
  end
>>>>>>> test_paper_processor
end
