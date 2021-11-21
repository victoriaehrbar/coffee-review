class Brand < ApplicationRecord
    has_many :coffees
    validates :brand_name, presence: true, uniqueness: true

    scope :alpha, -> {reorder(:brand_name)}
end
