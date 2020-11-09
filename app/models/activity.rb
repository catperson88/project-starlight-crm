class Activity < ApplicationRecord
  validates :type, inclusion: { in: ["Email", "Phone Call", "Social Media Interaction", "In person visit", "Just a Note"] }, presence: true
  validates :title, prescence: true
  validates :notes, presence: true
end



