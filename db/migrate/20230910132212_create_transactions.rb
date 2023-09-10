class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.decimal :client_amount, precision: 10, scale: 2
      t.decimal :merchant_amount, precision: 10, scale: 2
      t.string :reference_number
      t.references :card, null: false, foreign_key: true
      t.references :application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
