class Company < ApplicationRecord


  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, null: false
  validates :zip, numericality: true

  belongs_to :account
  has_many :contacts
  has_many :deals

end