class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 以下バリデーション
  # 空ではないこと
  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :money, :point, presence: true

  # 一意性であること
  validates :nickname, uniqueness: true

  # 一致していること, ７文字以上であること
  validates :password, confirmation: true, length: { minimum: 7 }

  # メールアドレスは@とドメインを含むこと

end
