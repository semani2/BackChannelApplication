class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.references :post

      t.timestamps
    end
    add_index :tags, :post_id
  end
end
