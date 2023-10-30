class Comment < ApplicationRecord
validates :content, presence: true
belongs_to :user,dependent: :destroy
belongs_to :prototype
#Comment belongs to User
end