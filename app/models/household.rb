class Household < ApplicationRecord
  validates :name, presence: true

  has_many :users, dependent: :destroy_all
end
