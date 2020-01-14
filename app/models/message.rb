class Message < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
end
