require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  describe "POST /tweets" do
    context "when not signed in" do
      it 'is successful' do
        post tweets_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  
    context "when signed in" do
      it 'craetes new tweet' do
        user = create(:user)
        sign_in user
        expect do
          post tweets_path, params: { tweet: { body: "New tweet" } } 
        end.to change{ Tweet.count }.by(1)
        
        expect(response).to redirect_to(dashboard_path)
      end
    end
  end
end