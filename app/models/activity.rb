class Activity < ApplicationRecord
  validates :type, inclusion: { in: ["Email", "Phone Call", "Social Media Interaction", "In person visit", "Just a Note"] }, presence: true
  validates :title, presence: true
  validates :notes, presence: true

  belongs_to :company
  belongs_to :contact
  belongs_to :deal
end



