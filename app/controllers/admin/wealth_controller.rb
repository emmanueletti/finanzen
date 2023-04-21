module Admin
  class WealthController < AdminController
    def index
      @assets ||= Admin::Asset.all
    end
  end
end
