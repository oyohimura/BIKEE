class Bike < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_one_attached :picture
  has_many :rents, dependent: :destroy
  validates :brand, presence: true
  validates :model, presence: true
  validates :price, presence: true, numericality: true
  validates :location, presence: true
  validates :electric, inclusion: [true, false]
  validates :picture, presence: true
  validates :description, length: { minimum: 10 }

  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: :location,
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
