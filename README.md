# テーブル設計
# List : プルダウンを設定する項目に"○"を記載。 自動で算出する項目に"●"を記載。

## users テーブル

| Column                | Type    | Options                 | List
| --------------------- | ------- | ----------------------- | ----
| nickname              | string  | null: false             | 
| email                 | string  | null: false, default:"" |
| password              | string  | null: false, default:"" |
| password_confirmation | string  | null: false, default:"" |
| first_name            | string  | null: false             | 
| last_name             | string  | null: false             | 
| first_name_kana       | string  | null: false             | 
| last_name_kana        | string  | null: false             | 
| birthday              | integer | null: false             | ○


### Association
- has_many :products
- has_many :orders



## items テーブル

| Column                    | Type       | Options                        | List 
| --------------------------| -----------|--------------------------------| ---- 
| item_image                | text       | null: false                    | 
| item_name                 | string     | null: false                    | 
| item_text                 | text       | null: false                    | 
| item_category             | string     | null: false                    | ○
| item_sales_status         | string     | null: false                    | ○
| item_shipping_fee_status  | string     | null: false                    | ○
| item_prefecture           | string     | null: false                    | ○
| item_scheduled_delivery   | string     | null: false                    | ○
| item_price                | integer    | null: false                    | 
| fee                       | integer    | null: false                    | ●
| profit                    | integer    | null: false                    | ●
| user_id                   | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- has_one :order



## ordersテーブル

| Column     | Type       | Options                        | 
| -----------|------------|--------------------------------| 
| user_id    | references | null: false, foreign_key: true | 
| item_id    | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :product
- has_one :address



## addressテーブル

| Column       | Type       | Options                        | List
| -------------|------------|--------------------------------| ----
| postal_code  | integer    | null: false                    | 
| prefecture   | string     | null: false                    | ○
| city         | string     | null: false                    | 
| addresses    | string     | null: false                    | 
| building     | string     | null: false                    | 
| phone_number | integer    | null: false                    | 
| order_id     | references | null: false, foreign_key: true | 

### Association
- belongs_to :order









# README

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
