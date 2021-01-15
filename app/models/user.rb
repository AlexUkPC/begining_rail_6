require "digest"

class User < ApplicationRecord
  attr_accessor :password
  validates :email, uniqueness: true
  validates :email, length: { in: 5..50 }
  validates :email, format: { with: /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i }
  validates :password, confirmation: true, if: :password_required?
  validates :password, length: { in: 4..20 }, if: :password_required?
  validates :password, presence: true, if: :password_required?

  has_one :profile
  has_many :articles, -> { order "published_at DESC, title ASC" },
    #dependent: :destroy #if you want to delete all articles belong to user when the user is deleted
    dependent: :nullify
  has_many :replies, through: :articles, source: :comments

  has_secure_token :draft_article_token

  before_save :encrypt_new_password

  def self.authenticate(email, password)
    user = find_by email: email
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end

  def draft_article_email
    "#{draft_article_token}@drafts.example.com"
  end
  
  protected

  def encrypt_new_password
    return if password.blank?
    self.hashed_password = encrypt(password)
  end

  def password_required?
    hashed_password.blank? || password.present?
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end
end
