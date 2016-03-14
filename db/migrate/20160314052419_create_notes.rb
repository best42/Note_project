class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.string :subject
      t.text :teacher
      t.integer :rating
      t.text :owner
      t.date :create_note

      t.timestamps null: false
    end
  end
end
