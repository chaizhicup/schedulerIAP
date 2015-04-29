require 'rails_helper'

RSpec.describe "students/show", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :name => "Name",
      :UIN => "Uin",
      :email => "Email",
      :US_Citizen => false,
      :degree => "Degree",
      :position_type => "Position Type",
      :Mock_1 => "Mock 1",
      :Mock_2 => "Mock 2",
      :Resume_1 => "Resume 1",
      :Resume_2 => "Resume 2",
      :Resume_3 => "Resume 3",
      :Lunch => "Lunch"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Uin/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Degree/)
    expect(rendered).to match(/Position Type/)
    expect(rendered).to match(/Mock 1/)
    expect(rendered).to match(/Mock 2/)
    expect(rendered).to match(/Resume 1/)
    expect(rendered).to match(/Resume 2/)
    expect(rendered).to match(/Resume 3/)
    expect(rendered).to match(/Lunch/)
  end
end
