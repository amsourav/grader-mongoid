json.array!(@exams) do |exam|
  json.extract! exam, :id, :name, :date
  json.url exam_url(exam, format: :json)
end
