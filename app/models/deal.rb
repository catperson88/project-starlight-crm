class Deal < ApplicationRecord
  validates :deal_name, presence: true
  validates :value, numericality: true, presence: true
  validates :stage,  inclusion: { in: ["Lead", "Qualified Lead", "Meeting", "Presentation", "Negotiation", "Closed Won", "Closed Lost", "Disqualified"] }, presence: true

  belongs_to :company
  has_many :contacts, through: :accounts

end

