module Admin
  class Asset < ApplicationRecord
    ASSET_CATEGORIES = [
      "stocks & bonds", "property", "cash",
      "vehicle", "collectible", "jewelry", "other"
    ].freeze

    has_many :asset_values, dependent: :delete_all

    validates :name, :owner, presence: true
    validates :category, presence: true,
      inclusion: {in: ASSET_CATEGORIES, case_sensitive: false}
    validates_associated :asset_values

    def latest_asset_value_amount
      @latest_asset_value_amount ||= asset_values.last&.amount
    end
  end
end
