class Message < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  # by default the order is ascending
  scope :custom_display, -> { order(:created_at).last(20) }
end
