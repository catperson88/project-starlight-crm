class Contact < ApplicationRecord

  validates :last_name, presence: true
  validates :zip, numericality: true

  belongs_to :company

end

