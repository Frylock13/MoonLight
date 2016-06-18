class Fight < ActiveRecord::Base

  belongs_to :player
  belongs_to :bot

  has_many :rounds, dependent: :destroy

  enum status: [:active, :finished]
end