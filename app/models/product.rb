class Product < ApplicationRecord
  validates :product_name, presence: true
  validates :product_value, numericality: true, presence: true
  validates :product_description, presence: true


end



