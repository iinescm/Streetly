class Complaint < ApplicationRecord
  belongs_to :user # posts a complaint
  belongs_to :category
  belongs_to :city
  validates :description, presence: true
  validates :address, presence: true
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
