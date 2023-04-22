module Admin
  class WealthController < AdminController
    def index
      @assets ||= Admin::Asset.all
      @debts ||= Admin::Debt.all
    end
  end
end
