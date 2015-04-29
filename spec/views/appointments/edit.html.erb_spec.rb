require 'rails_helper'

RSpec.describe "appointments/edit", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      :section => "MyString",
      :time_slot => "MyString",
      :company => "MyString",
      :student => "MyString",
      :UIN => "MyString"
    ))
  end

  it "renders the edit appointment form" do
    render

    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do

      assert_select "input#appointment_section[name=?]", "appointment[section]"

      assert_select "input#appointment_time_slot[name=?]", "appointment[time_slot]"

      assert_select "input#appointment_company[name=?]", "appointment[company]"

      assert_select "input#appointment_student[name=?]", "appointment[student]"

      assert_select "input#appointment_UIN[name=?]", "appointment[UIN]"
    end
  end
end
