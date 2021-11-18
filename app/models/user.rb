class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_coffees, through: :reviews, source: :coffee

    has_many :coffees

    validates :username, uniqueness: true, presence: true

    has_secure_password
end
