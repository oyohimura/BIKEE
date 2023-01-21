class Bike < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_many :rents, dependent: :destroy
  validates :brand, presence: true
  validates :model, presence: true
  validates :price, presence: true, numericality: true
  validates :location, presence: true
  validates :electric, inclusion: [true, false]

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
