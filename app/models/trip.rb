class Trip < ApplicationRecord
  belongs_to :user
  has_many :locations
  has_many :addresses, through: :locations
 
end
