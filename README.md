## userテーブル

| Column             | Type   | Options |
| ------------------ | ------ | ------- |
| profile            | text   |not null |
| name               | string |not null |
| email              | string |not null |
| encrypted_password | string |not null |
| occupation         | text   |not null |
| position           | text   |not null |

## prototypesテーブル

| Column     | Type       | Options   |
| ---------- | ---------- | ----------|
| title      | string     | not null  |
| catch-copy | text       | not null  |
| concept    | text       | not null  |
| user       | references | not null  |

## comments テーブル

| Column    | Type       | Options   |
| --------- | ---------- | --------- |
| content   | text       | not null  |
| user      | references | not null  |
| prototype | references | not null  |