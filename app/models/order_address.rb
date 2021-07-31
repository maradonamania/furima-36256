class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id,:prefecture_id,:postal_code,:city, :house_number, :building_name, :phone_number,:token,:price

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :prefecture_id
    end
    validates :city
    validates :house_number
    validates :phone_number,  format: {with: /\A\d{10,11}\z/}
  end

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(phone_number: phone_number,building_name: building_name,city: city,house_number: house_number,prefecture_id: prefecture_id,postal_code: postal_code)
  end
end