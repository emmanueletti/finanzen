module Admin
  class Asset < ApplicationRecord
    ASSET_CATEGORIES = [
      "stocks & bonds", "property", "cash",
      "vehicle", "collectible", "jewelry", "other"
    ].freeze

    validates :name, :owner, presence: true
    validates :category, presence: true, inclusion: {in: ASSET_CATEGORIES, case_sensitive: false}
    validates :starting_balance,
      numericality: {greater_than_or_equal_to: 0}
  end
end
