require 'rails_helper'

RSpec.describe "Circuitos", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/circuitos/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/circuitos/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/circuitos/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/circuitos/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
