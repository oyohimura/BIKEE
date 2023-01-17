class Rent < ApplicationRecord
  belongs_to :bike
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :rent_price, presence: true, numericality: true
  validates :status, presence: true
end
