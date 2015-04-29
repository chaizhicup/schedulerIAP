require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      :name => "MyString",
      :contact_person => "MyString",
      :contact_email => "MyString",
      :sponsor_level => "MyString",
      :citizenship => "MyString",
      :job_type => "MyString",
      :student_level => "MyString",
      :rep_1 => "MyString",
      :rep_2 => "MyString",
      :rep_3 => "MyString",
      :rep_4 => "MyString",
      :rep_5 => "MyString",
      :rep_6 => "MyString",
      :intvw_1_rep_no => 1,
      :intvw_2_rep_no => 1,
      :clinic_1_rep_no => 1,
      :clinic_2_rep_no => 1,
      :clinic_3_rep_no => 1
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "input#company_contact_person[name=?]", "company[contact_person]"

      assert_select "input#company_contact_email[name=?]", "company[contact_email]"

      assert_select "input#company_sponsor_level[name=?]", "company[sponsor_level]"

      assert_select "input#company_citizenship[name=?]", "company[citizenship]"

      assert_select "input#company_job_type[name=?]", "company[job_type]"

      assert_select "input#company_student_level[name=?]", "company[student_level]"

      assert_select "input#company_rep_1[name=?]", "company[rep_1]"

      assert_select "input#company_rep_2[name=?]", "company[rep_2]"

      assert_select "input#company_rep_3[name=?]", "company[rep_3]"

      assert_select "input#company_rep_4[name=?]", "company[rep_4]"

      assert_select "input#company_rep_5[name=?]", "company[rep_5]"

      assert_select "input#company_rep_6[name=?]", "company[rep_6]"

      assert_select "input#company_intvw_1_rep_no[name=?]", "company[intvw_1_rep_no]"

      assert_select "input#company_intvw_2_rep_no[name=?]", "company[intvw_2_rep_no]"

      assert_select "input#company_clinic_1_rep_no[name=?]", "company[clinic_1_rep_no]"

      assert_select "input#company_clinic_2_rep_no[name=?]", "company[clinic_2_rep_no]"

      assert_select "input#company_clinic_3_rep_no[name=?]", "company[clinic_3_rep_no]"
    end
  end
end
