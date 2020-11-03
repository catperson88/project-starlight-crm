class Contact < ApplicationRecord
  validates :first_name
  validates :last_name, presence: true
  validates :linkedin_URL
  validates :phone
  validates :email_address, 
  validates :zip, numericality: true
  validates :notes

end

