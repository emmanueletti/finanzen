module Admin
  class AssetValue < ApplicationRecord
    validates :date, presence: true
    #  comparison: {greater_than_or_equal_to: AssetValue.first.date}
    validates :amount,
      numericality: {greater_than_or_equal_to: 0}

    belongs_to :asset
  end

  private

  def first_value_date
    @first_value_date ||= AssetValue.first.date
  end
end
