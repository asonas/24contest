# -*- coding: utf-8 -*-
class PagesController < ApplicationController
  def index
    if authenticated?
      if current_user.anniversary.count == 0
        return redirect_to singularity_path
      else
        return redirect_to new_anniversary_path
      end
    end
  end

  def help
  end

  def singularity
  end

  def execute
    @anniversary = Anniversary.new
    @anniversary.anniversary = "時空が歪んだ日"
    @anniversary.description = "Cutendを使用して時空を歪ませるのに成功し、時の流れを掌握した日。"
    @anniversary.user_id = current_user.id
    @anniversary.date = Date.today

    # FIXME 3rd parameter
    # tweet_body = "@%s の時空が歪んだ。 http://hoge.com/%s/1" % [@anniversary.user.twitter_id, @anniversary.user.twitter_id]]
    tweet_body = "@%s の時空が歪んだ。" [@anniversary.user.twitter_id]
    tweet_result = current_user.tweet({:tweet_body => tweet_body, :user => current_user})
    @anniversary.tweet_id = tweet_result[:id].to_i
    @anniversary.save
    redirect_to anniversaries_path
  end

end
