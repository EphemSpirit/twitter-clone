class TweetsController < ApplicationController
  before_action :authenticate_user!
  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to dashboard_path
    else
      flash[:notice] = "something_went_wrong"
      redirect_to dashboard_path
    end
  end


  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end