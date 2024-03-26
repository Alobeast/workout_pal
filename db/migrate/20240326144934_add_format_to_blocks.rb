class AddFormatToBlocks < ActiveRecord::Migration[7.0]
  def change
    add_column :blocks, :format, :string
  end
end
