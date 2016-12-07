require 'rails_helper'

RSpec.describe "email_messages/show", type: :view do
  before(:each) do
    @email_message = assign(:email_message, EmailMessage.create!(
      :email => "Email",
      :title => "Title",
      :header => "MyText",
      :footer => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
