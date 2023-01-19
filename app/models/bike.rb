class Bike < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_many :rents, dependent: :destroy
  validates :brand, presence: true
  validates :model, presence: true
  validates :price, presence: true, numericality: true
  validates :location, presence: true
  validates :electric, inclusion: [true, false]
end
