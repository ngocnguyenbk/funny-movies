class Movie < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy

  validates :title, presence: true
  validates :url, presence: true, uniqueness: true

  def like!
    update!(likes_count: likes_count + 1)
  end

  def dislike!
    update!(dislikes_count: dislikes_count + 1)
  end
end
