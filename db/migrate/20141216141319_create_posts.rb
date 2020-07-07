class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end
end
