class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :owner
      t.string :type
      t.bigint :starting_balance

      t.timestamps
    end
  end
end
