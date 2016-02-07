json.array!(@courses) do |course|
  json.extract! course, :id, :code, :name, :semester, :year
  json.url course_url(course, format: :json)
end
