class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_coffees, through: :reviews, source: :coffee

    has_many :coffees

    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true

    has_secure_password

    def self.from_omniauth(auth)
      byebug
      self.find_or_create_by(username: auth[:info][:email]) do |u|
        u.password = SecureRandom.hex
      end
    end
end
