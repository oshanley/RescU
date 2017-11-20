class User < ApplicationRecord
#  attr_accessible :
  has_secure_password
  has_many :reports, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :first_name,  presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

end
