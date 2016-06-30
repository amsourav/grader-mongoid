class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  field :tag, type: String
  field :mark, type: Integer
  field :pages, type: Integer

  belongs_to :exam
  belongs_to :teacher

  has_many :part_questions
  accepts_nested_attributes_for :part_questions, reject_if: :all_blank, allow_destroy: true
end
