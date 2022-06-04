class StaffEvent < ApplicationRecord
  #モデルの中で以下のように書くとtypeカラムから特別ない意味が失われ普通のカラムとして使用できることになります
  self.inheritance_column = nil
  #belong_toメソッドでStaffMenberモデルがmenberという名前でStaffMenberモデルを参照することをclassを利用して宣言している
  belong_to :menber, class_name: "StaffMenber", foren_key: "staff_menber_id"
  alias_attribute :occurred_at, :createed_at
end
