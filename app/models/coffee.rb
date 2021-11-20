class Coffee < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :brand

  validates :name, presence: true
  validate :not_a_duplicate

  scope :order_by_score, -> {left_joins(:reviews).group(:id).order('avg(score) desc')}

  def self.alpha
    order(:name)
  end

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

  def name_and_brand_name
    "#{name} - #{brand.try(:brand_name)}"
  end
end
