json.array!(@companies) do |company|
  json.extract! company, :id, :name, :contact_person, :contact_email, :sponsor_level, :citizenship, :job_type, :student_level, :rep_1, :rep_2, :rep_3, :rep_4, :rep_5, :rep_6 
  json.url company_url(company, format: :json)
end
