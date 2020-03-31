class Complaint < ApplicationRecord
  belongs_to :user # posts a complaint
  belongs_to :category
  belongs_to :city
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
