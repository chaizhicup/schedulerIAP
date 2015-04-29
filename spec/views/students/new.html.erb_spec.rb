require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      :name => "MyString",
      :UIN => "MyString",
      :email => "MyString",
      :US_Citizen => false,
      :degree => "MyString",
      :position_type => "MyString",
      :Mock_1 => "MyString",
      :Mock_2 => "MyString",
      :Resume_1 => "MyString",
      :Resume_2 => "MyString",
      :Resume_3 => "MyString",
      :Lunch => "MyString"
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input#student_name[name=?]", "student[name]"

      assert_select "input#student_UIN[name=?]", "student[UIN]"

      assert_select "input#student_email[name=?]", "student[email]"

      assert_select "input#student_US_Citizen[name=?]", "student[US_Citizen]"

      assert_select "input#student_degree[name=?]", "student[degree]"

      assert_select "input#student_position_type[name=?]", "student[position_type]"

      assert_select "input#student_Mock_1[name=?]", "student[Mock_1]"

      assert_select "input#student_Mock_2[name=?]", "student[Mock_2]"

      assert_select "input#student_Resume_1[name=?]", "student[Resume_1]"

      assert_select "input#student_Resume_2[name=?]", "student[Resume_2]"

      assert_select "input#student_Resume_3[name=?]", "student[Resume_3]"

      assert_select "input#student_Lunch[name=?]", "student[Lunch]"
    end
  end
end
