class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :twitter_id
      t.string :icon_url
      t.string :access_token
      t.string :access_secret
      t.string :provider

      t.timestamps
    end
  end
end
