class User < ApplicationRecord
  before_save :downcase_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
    uniqueness: true,
    format: {with: URI::MailTo::EMAIL_REGEXP}

  belongs_to :household

  def is_admin?
    admin
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
