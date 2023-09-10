class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :status
      t.references :product, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2
      t.string :activation_number

      t.timestamps
    end
  end
end
