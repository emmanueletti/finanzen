class CreateValueTable < ActiveRecord::Migration[7.0]
  create_table :asset_values do |t|
    t.bigint :amount
    t.references :assets, foreign_key: true

    t.timestamps
  end

  def change
    remove_column :assets, :starting_balance
  end
end
