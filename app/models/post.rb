class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader
  
  belongs_to :user

  delegate :name, to: :user, prefix: true
  
  validates :body, presence: true
  validates :image, presence: true
end
