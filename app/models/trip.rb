class Trip < ApplicationRecord
  has_many :locations
  belongs_to :user
end