class Coffee < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :brand

  def brand_attributes=(attributes)
    self.brand = Brand.find_or_create_by(attributes) if !attributes['brand_name'].empty?
    self.brand
  end
end
