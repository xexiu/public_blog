class AddFeaturedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :featured_post, :string
  end
end
