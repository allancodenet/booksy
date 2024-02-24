class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, index: true
      t.text :subtitle
      t.string :isbn_10
      t.string :isbn_13
      t.text :descripton
      t.date :released_on
      t.references :publisher, null: false, foreign_key: true, index: true
      t.references :author, null: false, foreign_key: true, index: true

      t.timestamps
    end
    add_index :books, :isbn_10, unique: true
    add_index :books, :isbn_13, unique: true
  end
end
