class CreateAnniversaries < ActiveRecord::Migration
  def change
    create_table :anniversaries do |t|
      t.references :user
      t.string :anniversary
      t.string :description
      t.datetime :date
      t.string :tweet_id

      t.timestamps
    end
    add_index :anniversaries, :user_id
  end
end
