json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :attendance_type_id, :lesson_id, :student_id, :course_id, :date
  json.url attendance_url(attendance, format: :json)
end
