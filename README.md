# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| kanji_first_name   | string  | null: false               |
| kanji_last_name    | string  | null: false               |
| kana_first_name    | string  | null: false               |
| kana_last_name     | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :purchases
- has_many :displays

## displays テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| user         | references | null: false ,foreign_key: true|
| display_name | string     | null: false                   |
| instruction  | text       | null: false                   |
| genre_id     | integer    | null: false                   |
| status_id    | integer    | null: false                   |
| load_id      | integer    | null: false                   |
| area_id      | integer    | null: false                   |
| day_id       | integer    | null: false                   |
| price        | integer    | null: false                   |


### Association

- has_one    :purchase
- belongs_to :user

## purchases テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| display     | references | null: false, foreign_key: true |


### Association

- belongs_to :display
- belongs_to :user
- has_one :shipping_address

## shipping_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchase         | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| area_id          | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| house_name       | string     |                                |
| telephone_number | string     | null: false                    |

### Association

- belongs_to :purchase
