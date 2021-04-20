class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  FULL_WIDTH_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze # 全角(ひらがな・カタカナ・漢字)
  FULL_WIDTH_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze # 全角カタカナのみ
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze # 英数字混合

  validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' }
  with_options presence: true do
    validates :nickname
    with_options format: { with: FULL_WIDTH_REGEX, message: 'Full-width characters' } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: FULL_WIDTH_KATAKANA_REGEX, message: 'Full-width katakana characters' } do
      validates :kana_first_name
      validates :kana_last_name
    end
    validates :birthday
  end

  has_many :items
  has_many :purchases
end
