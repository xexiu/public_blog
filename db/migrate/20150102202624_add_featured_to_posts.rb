class AddFeaturedToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :featured_post, :string
  end
end
