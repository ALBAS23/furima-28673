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
| birth                | date           | null: false                         |

### Association
- has_many  :items
- has_many  :purchases
- has_one   :buyer_information

## itemsテーブル（出品商品管理機能）

| Column               | Type           | Options                             |
| -------------------- | -------------- | ----------------------------------- |
| image                |                | null: false                         |
| name                 | string         | null: false                         |
| explanation          | text           | null: false                         |
| category             | integer        | null: false                         |
| status               | integer        | null: false                         |
| delivery-fee         | integer        | null: false                         |
| shipment-source      | integer        | null: false                         |
| shipment-day         | integer        | null: false                         |
| price                | integer        | null: false                         |
| user                 | references     | null: false, foreign_key            |

### Association
- belongs_to  :user
- has_one  :purchase

## purchasesテーブル（購入履歴管理機能）

| Column               | Type           | Options                             |
| -------------------- | -------------- | ----------------------------------- |
| purchase_date        | date           | null: false                         |
| user                 | references     | null: false, foreign_key            |
| item                 | references     | null: false, foreign_key            |
| buyer_information    | references     | null: false, foreign_key            |

### Association
- belongs_to  :user
- belongs_to  :item
- belongs_to  :buyer_information

## buyer_information（購入者情報管理機能）

| Column               | Type           | Options                             |
| -------------------- | -------------- | ----------------------------------- |
| postal_code          | integer        | null: false                         |
| prefectures          | string         | null: false                         |
| municipality         | string         | null: false                         |
| address              | string         | null: false                         |
| phone_number         | integer        | null: false                         |
| purchase             | references     | null: false, foreign_key            |

### Association
- has_one     :purchase


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


