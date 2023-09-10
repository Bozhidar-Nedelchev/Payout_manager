class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.boolean :active, default: true
      t.string :name
      t.references :client, null: false, foreign_key: true
      t.string :uid
      t.string :secret

      t.timestamps
    end
    add_index :applications, :uid, unique: true
  end
end
