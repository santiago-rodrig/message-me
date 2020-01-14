class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 },
    uniqueness: { case_sensitive: false }

  has_many :messages, dependent: :destroy
  has_secure_password
end
