json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :course_id, :date, :start_time, :end_time, :room
  json.url lesson_url(lesson, format: :json)
end
