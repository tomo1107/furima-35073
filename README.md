# README
# テーブル設計

## usersテーブル
| Column              | Type     | Options                        |
| ------              | -------- | ------------------------------ |
| nickname            | string   | null: false                    |
| email               | string   | null: false, uniqueness: true  |
| encrypted_password  | string   | null: false                    |
| first_name          | string   | null: false                    |
| last_name           | string   | null: false                    |
| kana_first_name     | string   | null: false                    |
| kana_last_name      | string   | null: false                    |
| birthday            | date     | null: false                    |

### Association
- has_many :items
- has_one  :purchase


## itemsテーブル
| Column              | Type       | Options                        |
| ----------------    | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| price               | int        | null: false                    |
| category_id         | int        | null: false                    |
| item_status_id      | int        | null: false                    |
| delivery_fee_id     | int        | null: false                    |
| delivery_from_id    | int        | null: false                    |
| date_of_delivery_id | int        | null: false                    |
| is_purchased        | boolean    | null: false                    |
| user                | references | null: false, foreign_key: true |

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
- has_one    :delivery_information


## delivery_informationsテーブル
| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | int        | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone         | int        | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
