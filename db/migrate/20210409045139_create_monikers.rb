class CreateMonikers < ActiveRecord::Migration[6.1]
  def change
    create_table :monikers do |t|
      t.string :name
      t.string :uri
      t.text :memo
      t.integer :status

      t.timestamps
    end
  end
end
