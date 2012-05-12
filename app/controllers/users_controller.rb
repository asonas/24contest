class UsersController < ApplicationController
  def show
    @user = User.find_by_twitter_id(params[:twitter_id])
  end
end
