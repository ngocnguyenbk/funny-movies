class Movie < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy

  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
end
