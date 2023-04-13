FactoryBot.define do
  factory :movie do
    title { "MyString" }
    description { "MyText" }
    url { "https://www.youtube.com/watch?v=YfDqONbzYPc" }
    thumbnail_url { "https://i.ytimg.com/vi/9bZkp7q19f0/hqdefault.jpg" }
    likes_count { 0 }
    dislikes_count { 0 }
    association :user
  end
end
