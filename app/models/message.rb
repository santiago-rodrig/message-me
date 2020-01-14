class Message < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  scope :custom_display, -> { order(:created_at).first(20) }
end
