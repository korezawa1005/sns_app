class AddForeignKeyToPostsUser < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :posts, :users
  end
end
