require 'rails_helper'

RSpec.describe "appointments/show", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      :section => "Section",
      :time_slot => "Time Slot",
      :company => "Company",
      :student => "Student",
      :UIN => "Uin"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Section/)
    expect(rendered).to match(/Time Slot/)
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Student/)
    expect(rendered).to match(/Uin/)
  end
end
