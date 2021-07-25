class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_date
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message:"is Invalid. Input full-with characters"} do
      validates :last_name
      validates :first_name
    end
    with_options format: {with: /\A[ァ-ヶー]+\z/, message: "in Invalid. Input full-with characters"} do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end
