class User < ApplicationRecord
  has_secure_token
  has_secure_password

  has_many :decks, dependent: :destroy
  validates :full_name, presence: true
end
