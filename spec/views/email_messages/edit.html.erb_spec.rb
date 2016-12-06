require 'rails_helper'

RSpec.describe "email_messages/edit", type: :view do
  before(:each) do
    @email_message = assign(:email_message, EmailMessage.create!(
      :email => "MyString",
      :title => "MyString",
      :header => "MyText",
      :footer => "MyText"
    ))
  end

  it "renders the edit email_message form" do
    render

    assert_select "form[action=?][method=?]", email_message_path(@email_message), "post" do

      assert_select "input#email_message_email[name=?]", "email_message[email]"

      assert_select "input#email_message_title[name=?]", "email_message[title]"

      assert_select "textarea#email_message_header[name=?]", "email_message[header]"

      assert_select "textarea#email_message_footer[name=?]", "email_message[footer]"
    end
  end
end
