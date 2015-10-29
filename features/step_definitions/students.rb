Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
      Event.create!(event)
    # each returned element will be a hash whose key is the table header.
  end
end
