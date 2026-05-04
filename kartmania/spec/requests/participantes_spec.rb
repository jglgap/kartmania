require 'rails_helper'

RSpec.describe "Participantes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/participantes/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/participantes/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/participantes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/participantes/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
