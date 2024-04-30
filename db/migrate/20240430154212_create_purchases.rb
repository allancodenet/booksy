class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.monetize :price
      t.string :idempotency_key
      t.integer :status, default: 0
      t.string :charge_id
      t.string :token
      t.text :error, default: "{}", null: false

      t.timestamps
    end
    add_index :purchases, [:user_id, :book_id]
  end
end
