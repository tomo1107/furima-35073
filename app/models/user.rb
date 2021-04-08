class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  FULL_WIDTH_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  FULL_WIDTH_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/.freeze
  
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers' 
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates_format_of :first_name, with: FULL_WIDTH_REGEX, message: 'Full-width characters' 
  validates :last_name, presence: true
  validates_format_of :last_name, with: FULL_WIDTH_REGEX, message: 'Full-width characters' 
  validates :kana_first_name, presence: true
  validates_format_of :kana_first_name, with: FULL_WIDTH_KATAKANA_REGEX, message: 'Full-width katakana characters' 
  validates :kana_last_name, presence: true
  validates_format_of :kana_last_name, with: FULL_WIDTH_KATAKANA_REGEX, message: 'Full-width katakana characters' 
  validates :birthday, presence: true

  # has_many :items
  # has_many :purchases
end
