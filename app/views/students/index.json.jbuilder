json.array!(@students) do |student|
  json.extract! student, :id, :name, :UIN, :email, :US_Citizen, :degree, :position_type, :Mock_1, :Mock_2, :Resume_1, :Resume_2, :Resume_3, :Lunch
  json.url student_url(student, format: :json)
end
