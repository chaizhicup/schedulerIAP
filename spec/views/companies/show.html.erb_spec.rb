require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Contact Person/)
    expect(rendered).to match(/Contact Email/)
    expect(rendered).to match(/Sponsor Level/)
    expect(rendered).to match(/Citizenship/)
    expect(rendered).to match(/Job Type/)
    expect(rendered).to match(/Student Level/)
    expect(rendered).to match(/Rep 1/)
    expect(rendered).to match(/Rep 2/)
    expect(rendered).to match(/Rep 3/)
    expect(rendered).to match(/Rep 4/)
    expect(rendered).to match(/Rep 5/)
    expect(rendered).to match(/Rep 6/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
