class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :friend, index: true, null: false
      t.integer :user_id
      t.integer :friend_id
      t.integer :event_id

      t.timestamps
    end
  end
end
