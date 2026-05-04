require 'rails_helper'

RSpec.describe "Reservas", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/reservas/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/reservas/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/reservas/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/reservas/create"
      expect(response).to have_http_status(:success)
    end
  end

end
