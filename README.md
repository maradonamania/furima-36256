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
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer      | null: false                  |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| images             | text       | null: false                    |
| postage            | integer    | null: false,foreign_key: true  |

- belongs_to :user
- has_one :order
- belongs_to_active_hash :condition
- belongs_to_active_hash :category

# ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| item_id            | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |

## association

- belongs_to :item
- belongs_to :user
- has_one :addresses

# addressesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| order_id           | references | null: false, foreign_key: true |
| prefecture_id      | references | null: false, foreign_key: true |
| postal_code        | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | integer    | null: false                    |
| building_name      | string     |                                |
| phone_number       | integer    | null: false,                   |
| day_to_ship_id     | references | null: false, foreign_key: true |
| prefecture_id      | references | null: false, foreign_key: true |
## association

- belongs_to :order
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :days_to_ship