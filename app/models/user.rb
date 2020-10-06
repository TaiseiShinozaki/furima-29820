class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: true }
  validates :encrypted_password, presence: true
  validates :encrypted_password, confirmation: true
  validates :encrypted_password, length: {minimum: 6 }
  validates :birth_date, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
  end

end
