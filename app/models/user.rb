class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :introductions, dependent: :destroy
  has_many :introduction_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image

  validates :email, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :nickname, presence: true
  validates :introduction, length: {maximum: 50}
end
