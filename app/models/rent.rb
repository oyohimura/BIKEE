class Rent < ApplicationRecord
  belongs_to :bike
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :rent_price, presence: true, numericality: true
  validates :status, presence: true
  validate :start_end_check

  def start_end_check
    errors.add(:end_date, "Your start date cannot be after your end date") unless
    self.start_date < self.end_date
  end

  def rental_duration
    ((end_date - start_date) / 1.hour).round
  end

  def total_price
    (rental_duration * rent_price).round
  end
end
