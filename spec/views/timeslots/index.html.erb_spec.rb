require 'rails_helper'

RSpec.describe "timeslots/index", type: :view do
  before(:each) do
    assign(:timeslots, [
      Timeslot.create!(
        :att_date => "Att Date",
        :section => "Section",
        :slot => "Slot",
        :stunum => 1
      ),
      Timeslot.create!(
        :att_date => "Att Date",
        :section => "Section",
        :slot => "Slot",
        :stunum => 1
      )
    ])
  end

  it "renders a list of timeslots" do
    render
    assert_select "tr>td", :text => "Att Date".to_s, :count => 2
    assert_select "tr>td", :text => "Section".to_s, :count => 2
    assert_select "tr>td", :text => "Slot".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
