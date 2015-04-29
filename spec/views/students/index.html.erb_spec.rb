require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
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
      ),
      Student.create!(
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
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Uin".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Degree".to_s, :count => 2
    assert_select "tr>td", :text => "Position Type".to_s, :count => 2
    assert_select "tr>td", :text => "Mock 1".to_s, :count => 2
    assert_select "tr>td", :text => "Mock 2".to_s, :count => 2
    assert_select "tr>td", :text => "Resume 1".to_s, :count => 2
    assert_select "tr>td", :text => "Resume 2".to_s, :count => 2
    assert_select "tr>td", :text => "Resume 3".to_s, :count => 2
    assert_select "tr>td", :text => "Lunch".to_s, :count => 2
  end
end
