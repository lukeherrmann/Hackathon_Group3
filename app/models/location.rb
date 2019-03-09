class Location < ApplicationRecord
  has_one :address
  belongs_to :trip
end
