class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # デバイスの機能内容
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  validates :introduction, presence: true, length: {maximum: 50}

  validates :name, length: { minimum:2, maximum:20 }
  validates :name, presence: true

  attachment :profile_image

end
