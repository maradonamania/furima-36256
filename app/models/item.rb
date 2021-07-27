class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day_to_ship
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :image
  end     
  with_options numericality: {other_than:0,message:"can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :day_to_ship_id
  end


end
