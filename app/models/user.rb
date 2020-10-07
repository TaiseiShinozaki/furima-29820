class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  
  validates :password, length: {minimum: 6 }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :birth_date, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ , message: '全角で入力してください'} do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
  end

end