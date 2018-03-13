class Product < ApplicationRecord
  serialize :screenshots
  has_many :members, through: :member_products
  has_many :member_products, dependent: :destroy
  has_many :product_links
  accepts_nested_attributes_for :member_products
end