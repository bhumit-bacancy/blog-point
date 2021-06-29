class Comment < ApplicationRecord
    belongs_to :article
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :dislikes, dependent: :destroy
    # validates :description, obscenity:  { message: 'choose your word wisely' }
    validates :description, presence: true

    
end