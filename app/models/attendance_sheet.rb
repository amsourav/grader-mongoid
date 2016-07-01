class AttendanceSheet
  include Mongoid::Document
  field :file, type: String

  mount_uploader :file, AttendanceSheetUploader
  belongs_to :exam
end
