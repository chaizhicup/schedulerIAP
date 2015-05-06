require 'rails_helper'

RSpec.describe UseraddsController, type: :controller do

	 before { controller.stub(:authorize).and_return true }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
