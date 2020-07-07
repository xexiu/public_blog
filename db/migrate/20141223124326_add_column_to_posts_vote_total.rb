class AddColumnToPostsVoteTotal < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :vote_total, :integer, default: 0
  end
end
