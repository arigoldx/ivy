json.array!(@attendance_types) do |attendance_type|
  json.extract! attendance_type, :id, :name
  json.url attendance_type_url(attendance_type, format: :json)
end
