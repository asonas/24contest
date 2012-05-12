class CreateAnniversaries < ActiveRecord::Migration
  def change
    create_table :anniversaries do |t|

      t.timestamps
    end
  end
end
