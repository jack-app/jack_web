class Product < ApplicationRecord
  has_many :members, through: :member_products
  has_many :member_products
  accepts_nested_attributes_for :member_products
end
