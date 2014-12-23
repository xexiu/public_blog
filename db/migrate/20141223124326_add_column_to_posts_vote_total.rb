class AddColumnToPostsVoteTotal < ActiveRecord::Migration
  def change
    add_column :posts, :vote_total, :integer, default: 0
  end
end
