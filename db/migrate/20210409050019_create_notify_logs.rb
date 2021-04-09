class CreateNotifyLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :notify_logs do |t|
      t.string :name
      t.integer :moniker_id
      t.integer :api_id

      t.timestamps
    end
  end
end
