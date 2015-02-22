class ChangeColumnValue < ActiveRecord::Migration
  def change
    remove_column :global_configs, :value
    add_column :global_configs, :value_str, :string
  end
end
