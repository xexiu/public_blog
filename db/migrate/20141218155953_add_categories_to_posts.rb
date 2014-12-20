class AddCategoriesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :categories, :string
  end
end
