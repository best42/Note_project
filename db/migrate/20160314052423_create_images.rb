class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :image_id
      t.integer :x
      t.integer :y
      t.text :content
      t.references :note, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :images, :image_id
  end
end
