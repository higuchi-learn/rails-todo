class Task < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5}
  #validates:title -> titleカラムについてチェック
  #presence: ture 未入力チェック
end
