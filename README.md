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

- has_many : items
- has_one : addresses dependent: :destroy
- has_one : credit_cards dependent: :destroy
- has_many : comments dependent: :destroy

## imagesテーブル

| Column  | Type       | Options                         |
| --------| ---------- | ------------------------------- |
| image   | string     | null: false                     |  
| item_id | references | null: false, foreign_key: true  |

### Association

- belongs_to :items, dependent: :destroy

## comments テーブル

| Column     | Type       | Options                        |
| -----------| ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users

## items テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| user_id            | reference  | null: false, foreign_key:true   |  
| name               | string     | null: false                     |
| description        | text       | null: false                     |
| category_id        | integer    | null: false                     |
| condition_id       | integer    | null: false                     |
| postage_payer_id   | integer    | null: false                     |
| prefecture_id      | integer    | null: false                     |
| handling_time_id   | integer    | null: false                     |
| price              | integer    | null: false                     |

## Association
- belongs_to :users
- has_many :images dependent: :destroy
- has_many :comments 


## addressesテーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| user_id            | reference  | null: false, foreign_key:true   |
| post_code          | string     | null: false                     |  
| prefecture_id      | integer    | null: false, foreign_key:true   |
| city               | string     | null: false                     |
| town               | string     | null: false                     |
| building_name      | string     | null: false                     |
| phone_number       | integer    | null: false,uniqueness:true     |

## Association
- belongs_to :users

## credit_cards テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| user_id            | reference  | null: false, foreign_key:true   |  
| number             | integer    | null: false                     |
| year               | integer    | null: false                     |
| month              | integer    | null: false                     |
| cvc                | integer    | null: false                     |

## Association
- belongs_to :users

