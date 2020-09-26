# テーブル設計
# List : プルダウンを設定する項目に"○"を記載。 自動で算出する項目に"●"を記載。

## users テーブル

| Column                | Type    | Options                 | List
| --------------------- | ------- | ----------------------- | ----
| nickname              | string  | null: false             | 
| email                 | string  | null: false, default:"" |
| password              | string  | null: false, default:"" |
| first_name            | string  | null: false             | 
| last_name             | string  | null: false             | 
| first_name_kana       | string  | null: false             | 
| last_name_kana        | string  | null: false             | 
| birthday_id           | date    | null: false             | ○

### Association
- has_many :products
- has_many :orders



## items テーブル

| Column                 | Type       | Options                        | List 
| ---------------------- | -----------|--------------------------------| ---- 
| name                   | string     | null: false                    | 
| text                   | text       | null: false                    | 
| category_id            | integer    | null: false                    | ○
| sales_status_id        | integer    | null: false                    | ○
| shipping_fee_status_id | integer    | null: false                    | ○
| prefecture_id          | integer    | null: false                    | ○
| scheduled_delivery_id  | integer    | null: false                    | ○
| price                  | integer    | null: false                    | 
| user                   | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- has_one :order



## ordersテーブル

| Column     | Type       | Options                        |
| -----------|------------|--------------------------------|
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :address



## addressテーブル

| Column       | Type       | Options                        | List
| -------------|------------|--------------------------------| ----
| postal_code  | string     | null: false                    | 
| prefecture_id| integer    | null: false                    | ○
| city         | string     | null: false                    | 
| addresses    | string     | null: false                    | 
| building     | string     |                                | 
| phone_number | string     | null: false                    | 
| order        | references | null: false, foreign_key: true | 

### Association
- belongs_to :order