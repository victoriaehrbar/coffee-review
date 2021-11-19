class Review < ApplicationRecord
  belongs_to :user
  belongs_to :coffee

  validates :title, presence: true
  validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}


  validates :coffee, uniqueness: { scope: :user, message: "You have already reviewed this coffee."  }
end
