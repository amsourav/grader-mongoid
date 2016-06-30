json.array!(@questions) do |question|
  json.extract! question, :id, :tag, :mark
  json.url question_url(question, format: :json)
end
