json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :section, :time_slot, :company, :student, :UIN
  json.url appointment_url(appointment, format: :json)
end
