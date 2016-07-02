class PartQuestion
  include Mongoid::Document
  include Mongoid::Timestamps

  before_save :check_consistency

  field :sub_tag, type: String
  field :mark, type: Integer
  field :assigned_mark, type: Integer

  def check_consistency
    if self.assigned_mark == nil || self.assigned_mark <= mark
      true
    else
      false
    end
  end

  belongs_to :question
end
