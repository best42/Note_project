class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :x
      t.integer :y
      t.references :user, index: true, foreign_key: true
      t.references :noteimage, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :notes, column: :noteimage_id
  end
end
