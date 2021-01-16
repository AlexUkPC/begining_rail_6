class EmailAFriend
  include ActiveModel::Module
  
  attr_accessor :name, :email

  validates :name, :email, presence: true
  validates :email,format: { with: URI::MailTo::EMAIL_REGEX }
  
end