# テーブル設計 

## usersテーブル

| Column             | Type    | Options                         |
| ------------------ | ------- | ------------------------------- |
| nickname           | string  | null: false                     |
| last_name          | string  | null: false                     |
| first_name         | string  | null: false                     |
| birth_day_id       | integer | null: false , foreign_key: true |
| email              | string  | null: false                     |
| encrypted_password | string  | null: false                     |
| reading_last_name  | string  | null: false                     |
| reading_first_name | string  | null: false                     |

## association
- has_many :items
- has_many :orders
- belongs_to_active_hash :birth_day

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| -------------------------------|
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition          | text       | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

## association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :address


# ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
| postage            | integer    | null: false                    |
| address_id         | references | null: false, foreign_key: true |

## association

- belongs_to :item
- belongs_to :user

# addressesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| order_id           | references | null: false, foreign_key: true |
| prefecture_id      | references | null: false, foreign_key: true |
| day_id             | references | null: false, foreign_key: true |

## association

- belongs_to :order
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :days_to_ship