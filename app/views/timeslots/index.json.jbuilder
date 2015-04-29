json.array!(@timeslots) do |timeslot|
  json.extract! timeslot, :id, :att_date, :section, :slot, :stunum
  json.url timeslot_url(timeslot, format: :json)
end
