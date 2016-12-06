require "rails_helper"

RSpec.describe EmailMessagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/email_messages").to route_to("email_messages#index")
    end

    it "routes to #new" do
      expect(:get => "/email_messages/new").to route_to("email_messages#new")
    end

    it "routes to #show" do
      expect(:get => "/email_messages/1").to route_to("email_messages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/email_messages/1/edit").to route_to("email_messages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/email_messages").to route_to("email_messages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/email_messages/1").to route_to("email_messages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/email_messages/1").to route_to("email_messages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/email_messages/1").to route_to("email_messages#destroy", :id => "1")
    end

  end
end
