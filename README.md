# テーブル設計

## users テーブル

| Column            | Type   | Options                           |
| ----------------- | ------ | --------------------------------- |
| nickname          | string | null: false                       |
| last_name         | string | null: false                       |
| first_name        | string | null: false                       |
| last_name_kana    | string | null: false                       |
| first_name_kana   | string | null: false                       |
| email             | string | null: false, uniqueness:true      |
| password          | string | null: false, uniqueness:true      |
| birth_date        | date   | null: false                       |
### Association

- has_many :payments
- has_many :items
- has_many :comments dependent: :destroy

## comments テーブル

| Column     | Type       | Options                        |
| -----------| ---------- | ------------------------------ |
| comment    | text       |                                |
| user       | reference  | null: false, foreign_key: true |
| item       | reference  | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## items テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| user               | reference  | null: false, foreign_key:true   |  
| name               | string     | null: false                     |
| description        | text       | null: false                     |
| category_id        | integer    | null: false                     |
| condition_id       | integer    | null: false                     |
| postage_payer_id   | integer    | null: false                     |
| prefecture_id      | integer    | null: false                     |
| handling_time_id   | integer    | null: false                     |
| price              | integer    | null: false                     |

## Association
- belongs_to :user
- has_many :comments
- has_one :payment

## addressesテーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| payment            | reference  | null: false, foreign_key:true   |
| post_code          | string     | null: false                     |  
| prefecture_id      | integer    | null: false                     |  
| city               | string     | null: false                     |
| town               | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | string     | null: false,uniqueness:true     |

## Association
- belongs_to :payment

## paymentsテーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| user               | reference  | null: false, foreign_key:true   |
| item               | reference  | null: false, foreign_key:true   |

## Association
- has_one :address
- belongs_to :user
- belongs_to :item