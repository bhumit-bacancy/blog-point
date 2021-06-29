class User < ApplicationRecord
    before_save {self.email=email.downcase}
    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :dislikes, dependent: :destroy
    has_many :event_users
    has_many :events, through: :event_users    
    validates :username, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 25}
    validates_presence_of :username
    validates_presence_of :email
    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, uniqueness: { case_sensitive: false }, length: { maximum: 105}, format: { with: VALID_EMAIL}
    has_secure_password
end




