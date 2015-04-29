require 'rails_helper'

RSpec.describe "timeslots/show", type: :view do
  before(:each) do
    @timeslot = assign(:timeslot, Timeslot.create!(
      :att_date => "Att Date",
      :section => "Section",
      :slot => "Slot",
      :stunum => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Att Date/)
    expect(rendered).to match(/Section/)
    expect(rendered).to match(/Slot/)
    expect(rendered).to match(/1/)
  end
end
