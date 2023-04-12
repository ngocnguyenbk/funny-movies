class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { minimum: 6, maximum: 25 }, uniqueness: { case_sensitive: true }

  has_many :movies, dependent: :destroy
  has_many :votes, dependent: :destroy
end
