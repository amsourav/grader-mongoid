class PartQuestion
  include Mongoid::Document
  include Mongoid::Timestamps

  field :sub_tag, type: String
  field :mark, type: Integer
  belongs_to :question
end
