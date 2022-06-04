class RenameHashedPaswordColumnToAdmiinistrators < ActiveRecord::Migration[6.0]

  def change
    rename_column :admiinistrators, :hashed_pasword, :hashed_password
  end
end
