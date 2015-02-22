class AddClassStrToGlobalConfig < ActiveRecord::Migration
  def change
    add_column :global_configs, :class_str, :string
  end
end
