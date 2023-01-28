require 'rails_helper'

RSpec.describe "Usernames", type: :request do
  let(:user) { create(:user, username: nil) }

  before { sign_in user }

  describe "GET /new" do
    it "is successful" do
      get new_username_path
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT create" do
    context "when valid path" do
      it "updates username" do
        expect do
          put username_path(user), params: { user: { username: "foobar" } }
        end.to change{ user.reload.username }.from(nil).to("foobar")
        expect(response).to redirect_to dashboard_path
      end
    end

    context "when invalid path" do
      it "redirects to new username form" do
        expect do
          put username_path(user), params: { user: { username: "" } }
        end.not_to change{ user.reload.username }
        expect(response).to redirect_to(new_username_path)
      end
    end
    
  end
end