class PartQuestion
  include Mongoid::Document
  field :sub_tag, type: String
  field :mark, type: Integer
  field :page, type: Integer

  belongs_to :question
end
