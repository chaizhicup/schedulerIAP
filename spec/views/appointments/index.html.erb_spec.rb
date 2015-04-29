require 'rails_helper'

RSpec.describe "appointments/index", type: :view do
  before(:each) do
    assign(:appointments, [
      Appointment.create!(
        :section => "Section",
        :time_slot => "Time Slot",
        :company => "Company",
        :student => "Student",
        :UIN => "Uin"
      ),
      Appointment.create!(
        :section => "Section",
        :time_slot => "Time Slot",
        :company => "Company",
        :student => "Student",
        :UIN => "Uin"
      )
    ])
  end

  it "renders a list of appointments" do
    render
    assert_select "tr>td", :text => "Section".to_s, :count => 2
    assert_select "tr>td", :text => "Time Slot".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Student".to_s, :count => 2
    assert_select "tr>td", :text => "Uin".to_s, :count => 2
  end
end
