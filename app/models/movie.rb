class Movie < ApplicationRecord
  belongs_to :user

  def like!
    update!(likes_count: likes_count + 1)
  end

  def dislike!
    update!(dislikes_count: dislikes_count + 1)
  end
end
