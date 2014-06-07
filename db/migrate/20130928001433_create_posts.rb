class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_title
      t.text :post_content
      t.references :add_category
      t.references :user

      t.timestamps
    end
    add_index :posts, :category_id
    add_index :posts, :user_id
  end
end
