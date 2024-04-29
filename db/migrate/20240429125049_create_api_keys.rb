class CreateApiKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :api_keys do |t|
      t.string :key, index: true, unique: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
