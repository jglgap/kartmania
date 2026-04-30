require 'rails_helper'

RSpec.describe "Torneos", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/torneos/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/torneos/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/torneos/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/torneos/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
