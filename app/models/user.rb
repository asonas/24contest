class User < ActiveRecord::Base
  has_many :anniversary

  def self.create_with_omniauth(auth)
     user = User.new
     user.provider = auth[:provider]
     user.uid = auth[:uid]
     user.twitter_id = auth[:info][:nickname]
     user.icon_url = auth[:info][:image]
     user.save
     return user
  end

  def tweet(args)
    config = Rails.application.config.twitter["development"]
    Twitter.configure do |conf|
      conf.consumer_key       = config["consumer_key"]
      conf.consumer_secret    = config["consumer_secret"]
      conf.oauth_token        = args[:user].access_token
      conf.oauth_token_secret = args[:user].access_secret
    end
  end

  tweet = Twitter::Client.new
  tweet.update(args[:tweet_body])
end
