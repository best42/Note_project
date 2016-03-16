class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.string :subject
      t.text :teacher
      t.integer :rating
      t.references :user, index: true, foreign_key: true
      t.date :create_note

      t.timestamps null: false
    end
  end
end
