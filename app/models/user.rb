class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "はアルファベットと数字を含める必要があります。" }, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  # 関係性の追加
  has_many :posts, dependent: :destroy
  # Favoriteに関する関係性の追加
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :comments, dependent: :destroy

  # ユーザーがログインしているユーザーかどうか
  def own?(object)
    id == object&.user_id
  end

  # ユーザーがお気に入りにした
  def favorite(post)
    favorite_posts << post
  end

  # ユーザーがお気に入りを外した
  def unfavorite(post)
    favorite_posts.destroy(post)
  end

  # ユーザーがお気に入りかどうか
  def favorite?(post)
    favorite_posts.include?(post)
  end
end