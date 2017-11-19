class Report < ApplicationRecord
  belongs_to :user, dependent: :destroy

end
