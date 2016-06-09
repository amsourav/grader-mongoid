class Question
  include Mongoid::Document
  field :tag, type: String
  field :mark, type: String
  field :pages, type: Integer
  belongs_to :exam
  has_many :part_questions
  accepts_nested_attributes_for :part_questions, reject_if: :all_blank, allow_destroy: true
  has_one :teacher
end
