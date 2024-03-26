class AddModeToBlocks < ActiveRecord::Migration[7.0]
  def change
    add_column :blocks, :mode, :string
  end
end
