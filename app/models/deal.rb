class Deal < ApplicationRecord
  validates :deal_name, presence: true
  validates :value, numericality: true, presence: true
  validates :stage, presence: true

  belongs_to :company
  has_many :contacts, through: :accounts

end

