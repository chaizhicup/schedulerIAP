require 'rails_helper'

RSpec.describe "email_messages/index", type: :view do
  before(:each) do
    assign(:email_messages, [
      EmailMessage.create!(
        :email => "Email",
        :title => "Title",
        :header => "MyText",
        :footer => "MyText"
      ),
      EmailMessage.create!(
        :email => "Email",
        :title => "Title",
        :header => "MyText",
        :footer => "MyText"
      )
    ])
  end

  it "renders a list of email_messages" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
