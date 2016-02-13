class Questionpaperspec
  include Mongoid::Document
  include Mongoid::Timestamps
  field :tag, type: String
  field :marks, type: String
  field :page, type: String

  belongs_to :exam
end
