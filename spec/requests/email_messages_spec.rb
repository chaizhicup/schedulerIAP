require 'rails_helper'

RSpec.describe "EmailMessages", type: :request do
  describe "GET /email_messages" do
    it "works! (now write some real specs)" do
      get email_messages_path
      expect(response).to have_http_status(200)
    end
  end
end
