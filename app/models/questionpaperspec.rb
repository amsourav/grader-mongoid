class Questionpaperspec
  include Mongoid::Document
  include Mongoid::Timestamps
  field :tag, type: String
  field :marks, type: Integer
  field :page, type: Integer

  belongs_to :exam
  belongs_to :teacher
  has_one :job
end
