class Coffee < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :brand

  validates :name, presence: true
  validate :not_a_duplicate

  def brand_attributes=(attributes)
    self.brand = Brand.find_or_create_by(attributes) if !attributes['brand_name'].empty?
    self.brand
  end

  def not_a_duplicate
    coffee = Coffee.find_by(name: name, brand_id: brand_id)
    if !!coffee && coffee != self
      errors.add(:name, 'already added')
    end
  end
end
