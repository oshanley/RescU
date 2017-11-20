class Report < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode
  belongs_to :user
  
  def full_address
   [address, city, state, country, zipcode].compact.join(', ')
  end
end
