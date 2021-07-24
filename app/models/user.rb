class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message:"is Invalid. Input full-with characters"}
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message:"is Invalid. Input full-with characters"}
    validates :last_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "in Invalid. Input full-with characters"}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "in Invalid. Input full-with characters"}
  end
end
