class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_coffees, through: :reviews, source: :coffee

    has_many :coffees

    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true

    has_secure_password

    def self.from_omniauth(auth)
      where(email: auth[:info][:email]).first_or_initialize do |user|
        user.username = auth[:info][:email].split("@").first
        user.email = auth[:info][:email]
        user.password = SecureRandom.hex
      end
    end
end
