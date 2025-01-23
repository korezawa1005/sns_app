class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true # タイトルは必須
  validates :content, presence: true # 内容も必須
end
