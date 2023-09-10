class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants do |t|
      t.boolean :active
      t.string :name
      t.references :country, null: false, foreign_key: true
      t.decimal :payout_rate, precision: 5, scale: 2

      t.timestamps
    end
  end
end
