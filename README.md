# 

# Furimaアプリ データベース設計

## Usersテーブル（ユーザ管理機能） 

| Column               | Type           | Options                             |
| -------------------- | -------------- | ----------------------------------- |
| nickname             | string         | null: false                         |
| email                | string         | null: false                         |
| encrypted_password   | string         | null: false                         |
| last_name            | string         | null: false                         |
| first_name           | string         | null: false                         |
| last_name_kana       | string         | null: false                         |
| first_name_kana      | string         | null: false                         |
| birth_year           | integer        | null: false                         |
| birth_month          | integer        | null: false                         |
| birth_day            | integer        | null: false                         |

### Association
- has_many  :items
- has_many  :purchases

## itemsテーブル（商品管理機能）

| Column               | Type           | Options                             |
| -------------------- | -------------- | ----------------------------------- |
| image                |                | null: false                         |
| name                 | string         | null: false                         |
| explanation          | text           | null: false                         |
| category             | string         | null: false                         |
| status               | string         | null: false                         |
| delivery-fee         | string         | null: false                         |
| shipment-source      | string         | null: false                         |
| shipment-day         | integer        | null: false                         |
| price                | integer        | null: false                         |
| user_id              | references     | null: false, foreign_key            |

### Association
- belongs_to  :user
- has_one  :puchase

## purchasesテーブル（商品購入機能）

| Column               | Type           | Options                             |
| -------------------- | -------------- | ----------------------------------- |
| card_number          | integer        | null: false                         |
| expiration_month     | integer        | null: false                         |
| expiration_year      | integer        | null: false                         |
| security_code        | integer        | null: false                         |
| postal_code          | integer        | null: false                         |
| prefectures          | string         | null: false                         |
| municipality         | string         | null: false                         |
| address              | string         | null: false                         |
| phone_number         | integer        | null: false                         |
| user_id              | references     | null: false, foreign_key            |
| item_id              | references     | null: false, foreign_key            |

### Association
- belongs_to  :user
- belongs_to  :item


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


