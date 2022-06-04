# class Admiinistrator < ApplicationRecord
#   def password=(raw_password)
#     if raw_password.kind_of?(String)
#       self.hashed_password = BCrypt::Password.create(raw_password)
#     elsif raw_password.nil?
#       self.hashed_password = nil
#     end
#   end
# end


class Admiinistrator < ApplicationRecord
  # 平文のパスワードをハッシュ関数で処理してhashed_passwordに格納する
  def password=(raw_password)
    # 文字列が渡されたらハッシュ化
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    # nilはそのままセット
    elsif raw_password.nil?
      self.hashed_password = nil
    end
    # それ以外は何もしない
  end

 end