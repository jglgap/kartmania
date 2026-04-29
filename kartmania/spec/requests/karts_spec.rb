require 'rails_helper'

RSpec.describe "Karts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/karts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/karts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/karts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/karts/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
