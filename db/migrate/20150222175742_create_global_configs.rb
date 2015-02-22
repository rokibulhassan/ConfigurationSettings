class CreateGlobalConfigs < ActiveRecord::Migration
  def change
    create_table :global_configs do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
