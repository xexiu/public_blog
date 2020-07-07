class AddCategoriesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :categories, :string
  end
end
