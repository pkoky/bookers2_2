class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # :パスワードの正確性を検証, :ユーザー登録や編集、削除,
        # :パスワードをリセット, :ログイン情報を保存, :emailのフォーマットなどのバリデーション

  has_many :books, dependent: :destroy

  attachment :profile_image



end
