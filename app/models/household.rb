class Household < ApplicationRecord
  validates :name, presence: true

  # Everything is owned at the household level
  # User model is used for auth and admin controls
  has_many :users, dependent: :destroy_all
end
