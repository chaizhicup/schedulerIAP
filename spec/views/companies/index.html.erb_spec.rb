require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :name => "Name",
        :contact_person => "Contact Person",
        :contact_email => "Contact Email",
        :sponsor_level => "Sponsor Level",
        :citizenship => "Citizenship",
        :job_type => "Job Type",
        :student_level => "Student Level",
        :rep_1 => "Rep 1",
        :rep_2 => "Rep 2",
        :rep_3 => "Rep 3",
        :rep_4 => "Rep 4",
        :rep_5 => "Rep 5",
        :rep_6 => "Rep 6",
        :intvw_1_rep_no => 1,
        :intvw_2_rep_no => 2,
        :clinic_1_rep_no => 3,
        :clinic_2_rep_no => 4,
        :clinic_3_rep_no => 5
      ),
      Company.create!(
        :name => "Name",
        :contact_person => "Contact Person",
        :contact_email => "Contact Email",
        :sponsor_level => "Sponsor Level",
        :citizenship => "Citizenship",
        :job_type => "Job Type",
        :student_level => "Student Level",
        :rep_1 => "Rep 1",
        :rep_2 => "Rep 2",
        :rep_3 => "Rep 3",
        :rep_4 => "Rep 4",
        :rep_5 => "Rep 5",
        :rep_6 => "Rep 6",
        :intvw_1_rep_no => 1,
        :intvw_2_rep_no => 2,
        :clinic_1_rep_no => 3,
        :clinic_2_rep_no => 4,
        :clinic_3_rep_no => 5
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Person".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Email".to_s, :count => 2
    assert_select "tr>td", :text => "Sponsor Level".to_s, :count => 2
    assert_select "tr>td", :text => "Citizenship".to_s, :count => 2
    assert_select "tr>td", :text => "Job Type".to_s, :count => 2
    assert_select "tr>td", :text => "Student Level".to_s, :count => 2
    assert_select "tr>td", :text => "Rep 1".to_s, :count => 2
    assert_select "tr>td", :text => "Rep 2".to_s, :count => 2
    assert_select "tr>td", :text => "Rep 3".to_s, :count => 2
    assert_select "tr>td", :text => "Rep 4".to_s, :count => 2
    assert_select "tr>td", :text => "Rep 5".to_s, :count => 2
    assert_select "tr>td", :text => "Rep 6".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
