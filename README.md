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
| birth_day            | date    | null: false |

## users アソシエーション

- has_many :commodities
- has_many :buys

## commodities テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| detail             | text       | null: false |
| price              | integer    | null: false |
| category_id        | integer    | null: false |
| prefecture_id      | integer    | null: false |
| send_day_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| user               | references | null: false, foreign_key: true|

## commodities アソシエーション

- belongs_to :user
- has_one :buy

## buys テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null:false, foreign_key: true|
| commodity          | references | null:false, foreign_key: true|

## buy アソシエーション

- belongs_to :user
- belongs_to :commodity
- has_one :buyer_address

## buyer_addresses テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| post_code          | string    | null: false |
| prefecture_id      | integer   | null: false |
| city               | string    | null: false |
| address            | string    | null: false |
| building_name      | string    |             |
| phone_number       | string    | null: false |
| buy                | references| null: false, foreign_key: true|

## buyer_address アソシエーション

- belongs_to :buy

