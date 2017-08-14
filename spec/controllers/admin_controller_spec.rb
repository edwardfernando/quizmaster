require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  
  describe "#index" do
    context "when request coming to /admin" do
      it "responds with 200" do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end
end
