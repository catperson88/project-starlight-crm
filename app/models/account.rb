class Account < ApplicationRecord


  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, null: false
  validates :zip, numericality: true
  validates :description

end

