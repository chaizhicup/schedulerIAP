FactoryGirl.define do
  factory :event do
    name "MyString"
    event_date Date.new(2015, 9, 9)
    start_time DateTime.new(2015, 9, 9, 10, 0, 0)
    end_time DateTime.new(2015, 9, 9, 10, 0, 0)
    for_students true
    max_students 30
    timeslot_duration 20
  end

end
