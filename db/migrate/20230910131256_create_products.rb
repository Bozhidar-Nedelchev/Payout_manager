class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.boolean :active
      t.string :name
      t.decimal :amount, precision: 10, scale: 2
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
