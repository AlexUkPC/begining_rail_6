class User < ApplicationRecord
  has_one :profile
  has_many :articles, ->{order 'published_at DESC, title ASC'},
    #dependent: :destroy #if you want to delete all articles belong to user when the user is deleted
    dependent: :nullify
end
