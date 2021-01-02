# 

# Furimaアプリ データベース設計

## Usersテーブル（ユーザ管理機能） 

| Column               | Type           | Options                             |
| -------------------- | -------------- | ----------------------------------- |
| nickname             | string         | null: false                         |
| email                | string         | null: false, unique: true           |
| encrypted_password   | string         | null: false                         |
| last_name            | string         | null: false                         |
| first_name           | string         | null: false                         |
| last_name_kana       | string         | null: false                         |
| first_name_kana      | string         | null: false                         |
| birth                | date           | null: false                         |

### Association
- has_many  :items
- has_many  :purchases

## itemsテーブル（出品商品管理機能）

| Column                   | Type           | Options                             |
| ------------------------ | -------------- | ----------------------------------- | 
| name                     | string         | null: false                         |
| explanation              | text           | null: false                         |
| category_id              | integer        | null: false                         |
| status_id                | integer        | null: false                         |
| delivery_fee_id          | integer        | null: false                         |
| shipment_prefecture_id   | integer        | null: false                         |
| shipment_day_id          | integer        | null: false                         |
| price                    | integer        | null: false                         |
| user                     | references     | null: false, foreign_key            |

### Association
- belongs_to  :user
- has_one     :purchase

## ordersテーブル（購入履歴管理機能）

| Column               | Type           | Options                             |
| -------------------- | -------------- | ----------------------------------- |
| user                 | references     | null: false, foreign_key            |
| item                 | references     | null: false, foreign_key            |

### Association
- belongs_to  :user
- belongs_to  :item
- has_one     :buyer_information

## buyer_information（購入者情報管理機能）

| Column                   | Type           | Options                             |
| ------------------------ | -------------- | ----------------------------------- |
| postal_code              | string         | null: false                         |
| shipment_prefecture_id   | integer        | null: false                         |
| municipality             | string         | null: false                         |
| address                  | string         | null: false                         |
| building                 | string         |                                     |
| phone_number             | string         | null: false                         |
| purchase                 | references     | null: false, foreign_key            |

### Association
- belongs_to  :purchase


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


