class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user_tweets = current_user.tweets
    @tweet_bodies = @user_tweets.map(&:body)
  end
end