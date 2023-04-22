class HomeController < AdminController
  def index
    @total_wealth = total_assets + total_debts
  end

  private

  def total_assets
    ::Admin::Asset.all.sum do |asset|
      asset.asset_values.last.amount
    end
  end

  def total_debts
    ::Admin::Debt.all.sum do |debt|
      debt.debt_values.last.amount
    end
  end
end
