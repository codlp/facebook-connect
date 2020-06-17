class AddFriendsListToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :friends_list, :string
  end
end
