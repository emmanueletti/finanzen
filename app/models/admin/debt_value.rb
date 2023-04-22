module Admin
  class DebtValue < ApplicationRecord
    validates :date, presence: true
    validates :amount,
      numericality: {less_than_or_equal_to: 0}

    belongs_to :debt
  end
end
