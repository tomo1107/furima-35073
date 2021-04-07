# README
# テーブル設計

## usersテーブル
| Column          | Type     | Options                        |
| ------          | -------- | ------------------------------ |
| nickname        | string   | null: false                    |
| email           | string   | null: false                    |
| password        | string   | null: false                    |
| first_name      | string   | null: false                    |
| last_name       | string   | null: false                    |
| kana_first_name | string   | null: false                    |
| kana_last_name  | string   | null: false                    |
| birth_year      | int      | null: false                    |
| birth_month     | int      | null: false                    |
| birth_day       | int      | null: false                    |

### Association
- has_many :items
- has_one  :purchase


## itemsテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| description      | text       | null: false                    |
| price            | int        | null: false                    |
| category         | string     | null: false                    |
| item_status      | string     | null: false                    |
| delivery_fee     | string     | null: false                    |
| delivery_from    | string     | null: false                    |
| date_of_delivery | int        | null: false                    |
| is_purchased     | boolean    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル
| Column     | Type       | Options                        |
| ------     | --------   | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## delivery_informationsテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | int        | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     | null: false                    |
| phone       | int        | null: false                    |
| purchase    | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
