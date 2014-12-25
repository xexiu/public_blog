class DropFieldsAndIndexFromComments < ActiveRecord::Migration
  def change
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    remove_column :comments, :parent_id, :integer
    remove_reference :comments, :post, index: true
    remove_index :comments, [:post_id, :created_at]
  end
end
