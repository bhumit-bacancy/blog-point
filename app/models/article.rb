class Article < ApplicationRecord
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories    
    has_many :comments
    has_many :likes, dependent: :destroy
    has_many :dislikes, dependent: :destroy
    validates :title, presence:true,length:{minimum: 6,maximum:100}
    validates :description, presence:true,length:{minimum: 10,maximum:300}
end