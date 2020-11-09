class Contact < ApplicationRecord

  validates :last_name, presence: true


  belongs_to :company

end

