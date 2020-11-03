class Contact < ApplicationRecord
  validates :deal_name, presence: true
  validates :value, numericality: true, presence: true
  validates :discount_percentage
  validates :description
  validates :stage, presence: true
  validates :quantity

end

