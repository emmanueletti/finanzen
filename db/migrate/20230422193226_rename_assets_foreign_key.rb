class RenameAssetsForeignKey < ActiveRecord::Migration[7.0]
  def change
    rename_column :asset_values, :assets_id, :asset_id
  end
end
