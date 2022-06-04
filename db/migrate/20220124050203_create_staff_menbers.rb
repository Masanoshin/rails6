class CreateStaffMenbers < ActiveRecord::Migration[6.0]
  def change
    create_table :staff_menbers do |t|
      t.string :email, null: false #メールアドレス
      t.string :family_name, null: false #性
      t.string :given_name, null: false #名
      t.string :family_name_kana, null: false #性カナ
      t.string :given_name_kana, null: false #名カナ
      t.string :hashed_password #パスワード
      t.date :start_date, null: false #名
      t.date :end_date #終了日
      t.boolean :suspended, null: false, default: false #無効フラグ

      t.timestamps
    end

    add_index :staff_menbers, "LOWER(email)", unique: true
    add_index :staff_menbers, [ :family_name_kana, :given_name_kana ]
  end
end
