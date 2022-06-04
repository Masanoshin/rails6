class CreateAdmiinistrators < ActiveRecord::Migration[6.0]
  def change
    create_table :admiinistrators do |t|
      t.string :email, null: false
      t.string :hashed_pasword
      t.boolean :suspended, null: false, default: false #無効フラグ
      t.timestamps
    end

    add_index :admiinistrators, "LOWER(email)", unique: true
  end
end
