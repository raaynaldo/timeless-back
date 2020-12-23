class CreateUserFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :user_followers do |t|
      t.integer :followee_id
      t.integer :follower_id

      t.timestamps
    end
  end
end
