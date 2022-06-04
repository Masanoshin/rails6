class StaffMenber < ApplicationRecord
  has_many :events,  dependent: :destroy

  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end

  def active?
    !suspended? && start_date <= Date.today && (end_date.nil? || end_date > Date.today)
  end

end


# kind_of?は、以下のように使用します。
# オブジェクト.kind_of?(クラス)
# 例えば、str = “test”がString型かどうかを調べる場合は
# str.kind_of?(String)
# と記載します。この場合は、strはstring型なのでtrueを返します。
