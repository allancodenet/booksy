class RenameColumnDescripton < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :descripton, :description
  end
end
