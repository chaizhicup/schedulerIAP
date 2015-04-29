require 'rails_helper'

RSpec.describe "timeslots/new", type: :view do
  before(:each) do
    assign(:timeslot, Timeslot.new(
      :att_date => "MyString",
      :section => "MyString",
      :slot => "MyString",
      :stunum => 1
    ))
  end

  it "renders new timeslot form" do
    render

    assert_select "form[action=?][method=?]", timeslots_path, "post" do

      assert_select "input#timeslot_att_date[name=?]", "timeslot[att_date]"

      assert_select "input#timeslot_section[name=?]", "timeslot[section]"

      assert_select "input#timeslot_slot[name=?]", "timeslot[slot]"

      assert_select "input#timeslot_stunum[name=?]", "timeslot[stunum]"
    end
  end
end
