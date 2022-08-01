# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------  | ----------- |
| nickname             | string  | null: false |
| email                | string  | null: false, unique: true|
| encrypted_password   | string  | null: false |
| last_name            | string  | null: false |
| first_name           | string  | null: false |
| last_kana            | string  | null: false |
| first_kana           | string  | null: false |
| birth_year           | integer | null: false |
| birth_month          | integer | null: false |
| birth_day            | integer | null: false |

## users アソシエーション

- has_many :commodities
- has_many :comments
- has_one  :buy

## commodities テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| price              | integer    | null: false |
| category           | text       | null: false |
| seller_area        | string     | null: false |
| send_day           | string     | null: false |
| condition          | string     | null: false |
| user               | references | null: false, foreign_key: true|

## commodities アソシエーション

- belongs_to :user
- has_one :buy
- has_many :comments

## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -----------                    |
| text               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| commodity          | references | null: false, foreign_key: true |

## comments アソシエーション

- belongs_to :user
- belongs_to :commodity

## buy テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| card_number        | integer    | null: false |
| card_expiration    | integer    | null: false |
| card_security_code | integer    | null: false |
| user               | references | null:false, foreign_key: true|
| commodity          | references | null:false, foreign_key: true|
| buyer_address      | references | null:false, foreign_key: true|

## buy アソシエーション

- has_one :user
- has_one :commodity
- has_one :buyer_address

## buyer_address テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| post_code          | integer   | null: false |
| prefecture         | string    | null: false |
| city               | string    | null: false |
| address            | text      | null: false |
| building_name      | text      |             |
| phone_number       | integer   | null: false |
| buy                | references| null: false, foreign_key: true|

## buyer_address アソシエーション

- has_one :buy

