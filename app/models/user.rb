class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy # Userとlikesとの直接的なアソシエーション.ユーザーが「どのLikeを作成したか」を直接扱うための定義
  has_many :liked_posts, through: :likes, source: :post # liked_posts UserとPostモデルの間接的な関係.ユーザーが「どの投稿をいいねしたか」を扱うための定義。
  # through: :likes likesテーブルを経由して、UserとPostの関係を定義します source: :post likesテーブルのpostという関連を経由してPostモデルを参照することを指定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
