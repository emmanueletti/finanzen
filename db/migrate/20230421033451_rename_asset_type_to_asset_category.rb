class RenameAssetTypeToAssetCategory < ActiveRecord::Migration[7.0]
  def change
    rename_column :assets, :type, :category
  end
end
