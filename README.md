# テーブル設計 

## usersテーブル

| Column             | Type    | Options                         |
| ------------------ | ------- | ------------------------------- |
| nickname           | string  | null: false                     |
| last_name          | string  | null: false                     |
| first_name         | string  | null: false                     |
| birth_day          | date    | null: false                     |
| email              | string  | null: false, unique: true       |
| encrypted_password | string  | null: false                     |
| reading_last_name  | string  | null: false                     |
| reading_first_name | string  | null: false                     |

## association
- has_many :items
- has_many :orders

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| -------------------------------|
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| postage_id         | integer    | null: false                    |
| day_to_ship_id     | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |

- belongs_to :user
- has_one :order
- belongs_to_active_hash :condition
- belongs_to_active_hash :category
- belongs_to_active_hash :days_to_ship
- belongs_to_active_hash :postage
- belongs_to_active_hash :prefecture

# ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

## association

- belongs_to :item
- belongs_to :user
- has_one :address

# addressesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| order              | references | null: false, foreign_key: true |
| prefecture_id      | integer    | null: false                    |
| postal_code        | string     | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |


## association

- belongs_to :order
- belongs_to_active_hash :prefecture
