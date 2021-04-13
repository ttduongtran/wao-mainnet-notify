class AddMonikerTypeToMoniker < ActiveRecord::Migration[6.1]
  def change
    add_column :monikers, :moniker_type, :integer, default: 0
  end
end
