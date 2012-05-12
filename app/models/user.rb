class User < ActiveRecord::Base
  attr_accessible :access_secret, :access_token, :icon_url, :twitterID, :uid
end
