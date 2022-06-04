class CreateStaffEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :staff_events do |t|
      t.references :staff_menber, null: false, index: false, foreign_key: true #職員レコードへの外部キー
      #referencesメソッドは指定された名前の末尾に_idを追加しその名前を持つ整数型のカラムを定義する ここではstaff_menber_id
      #foren_keyオプションにtrueを指定すると外部キー制約を設定できる
      t.string :type, null: false #イベントタイプ
      t.datetime :createed_at, null: false #発生時刻
    end

    add_index :staff_events, :createed_at
    add_index :staff_events, [ :staff_menber_id, :createed_at]
  end
end
