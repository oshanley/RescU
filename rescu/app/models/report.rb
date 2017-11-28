class Report < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode
  belongs_to :user

  validates :title, presence: true, length: { maximum: 55 }
  validates :description, presence: true, length: { minimum: 100 }
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { minimum: 2 }
  validates :country, presence: true
  validates :zipcode, presence: true, length: { minimum: 2 }
  validates :severity, presence: true 
 
  def full_address
   [address, city, state, country, zipcode].compact.join(', ')
  end
  
end
