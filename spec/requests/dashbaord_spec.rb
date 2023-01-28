require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
  context "when no current user" do
    it "redirects away" do
      get dashboard_path
      expect(response).to have_http_status(302)
    end
  end

  context "when current_user" do
    it "is successful" do
      user = create(:user)
      sign_in user
      get dashboard_path
      expect(response).to have_http_status(200)
    end
  end
end