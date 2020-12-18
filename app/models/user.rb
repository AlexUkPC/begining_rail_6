class User < ApplicationRecord
  validates :email, uniqueness: true 
  validates :email, length: {in: 5..50}
  validates :email, format: {with: /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i}
  validates :password, confirmation: true
  
  has_one :profile
  has_many :articles, ->{order 'published_at DESC, title ASC'},
    #dependent: :destroy #if you want to delete all articles belong to user when the user is deleted
    dependent: :nullify
  has_many :replies, through: :articles, source: :comments
end
