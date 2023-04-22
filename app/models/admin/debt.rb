module Admin
  class Debt < ApplicationRecord
    DEBT_CATEGORIES = [
      "credit card", "mortgage", "student loan", "car loan", "personal loan",
      "line of credit", "margin loan", "other"
    ].freeze

    has_many :debt_values, dependent: :delete_all

    validates :name, :owner, presence: true
    validates :category, presence: true,
      inclusion: {in: DEBT_CATEGORIES, case_sensitive: false}
    validates_associated :debt_values

    def latest_debt_value_amount
      @latest_debt_value_amount ||= debt_values.last&.amount
    end
  end
end
