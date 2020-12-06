# アプリケーション名

FURIMA

# URL

https://furima-29820.herokuapp.com

# BASIC認証

ID : admin
PASSWORD : 2222

# テスト用アカウント

購入者用
メールアドレス: buyer1234@gmail.com
パスワード: test1234

購入用カード情報
番号：4242424242424242
期限：現在より未来
セキュリティコード：123

出品者用
メールアドレス名: seller1234@gmail.com
パスワード: test1234

# 開発状況

開発環境
Ruby/Ruby on Rails/MySQL/Github/AWS/PAY.JP /Visual Studio Code

開発期間と平均作業時間
開発期間：9/29~10/22 (23日間)
1日あたりの平均作業時間：6
合計：207時間程度

# 動作確認方法

WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
接続先およびログイン情報については、上記の通りです。
同時に複数の方がログインしている場合に、ログインできない可能性があります。
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
確認後、ログアウト処理をお願いします。

# 工夫した点

コードを他の人がみてもわかりやすいように記しました。
コードをまとめる事で可読性を向上しようと努めました。
コントローラー名やモデル名をそれぞれの繋がりがわかりやすいように名前を付けました。

# 苦労した点

エラーが発生し、自身で考えても改善策が浮かばない時や浮かびそれを試してもエラーが改善できない時がやはり一番苦労しました。
しかし色々な目線でアプローチを何度か変えて試みたところエラーが解決した時は達成感を覚えました。
一人で悩み続けても良いことは少ないと気付き、相談できる先輩や友人に自分の意見、仮説を述べ、もらったフィードバックをすり合わせながら仮説をブラッシュアップしていくことが大切だと考えています。
これからも自分のやり方や考えに固執しすぎることなく、より多くの人から視点や考えを吸収し問題に対処できるようにしていきたいと思います。

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

- has_many :orders
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
- has_one :order

## addressesテーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| order              | reference  | null: false, foreign_key:true   |
| post_code          | string     | null: false                     |  
| prefecture_id      | integer    | null: false                     |  
| city               | string     | null: false                     |
| town               | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | string     | null: false,uniqueness:true     |

## Association
- belongs_to :order

## ordersテーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| user               | reference  | null: false, foreign_key:true   |
| item               | reference  | null: false, foreign_key:true   |

## Association
- has_one :address
- belongs_to :user
- belongs_to :item
