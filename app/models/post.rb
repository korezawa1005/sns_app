class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true # タイトルは必須
  validates :content, presence: true # 内容も必須
end
