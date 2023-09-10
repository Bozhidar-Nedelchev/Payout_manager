class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.boolean :active
      t.string :name
      t.text :description
      t.string :redemption
      t.references :merchant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
