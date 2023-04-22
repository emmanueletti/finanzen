class HomeController < AdminController
  def index
    total_assets = ::Admin::Asset.all.sum do |asset|
      asset.asset_values.last.amount
    end
    @total_wealth = total_assets
  end

  private

  def total_wealth
  end
end
