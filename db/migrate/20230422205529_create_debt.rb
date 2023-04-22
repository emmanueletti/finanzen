class CreateDebt < ActiveRecord::Migration[7.0]
  def change
    # create liabilties table
    create_table :debts do |t|
      t.string :name
      t.string :owner
      t.string :category

      t.timestamps
    end

    # create liability_values table
    create_table :debt_values do |t|
      t.bigint :amount
      t.datetime :date
      t.references :debt, foreign_key: true

      t.timestamps
    end
  end
end
