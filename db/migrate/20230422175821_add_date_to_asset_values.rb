class AddDateToAssetValues < ActiveRecord::Migration[7.0]
  def change
    add_column :asset_values, :date, :datetime
  end
end
