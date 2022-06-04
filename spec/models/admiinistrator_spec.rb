# require 'rails_helper'

# RSpec.describe Admiinistrator, type: :model do
#   # pending "add some examples to (or delete) #{__FILE__}"
#   describe "#password=" do
#     example "文字を与えると、hashed_passwordは長さ６０の文字列になる" do
#       member = Admiinistrator.new
#       member.password = "basukis"
#       expect(member.hashed_password).to be_kind_of(String)
#       expect(member.hashed_password.size).to eq(60)
#     end

#     example "nillを与えると、hashed_passwordはnilになる" do
#       member = Admiinistrator.new(hashed_password: "X")
#       member.password = nil
#       expect(member.hashed_password).to be_nil
#     end
#   end
# end

require 'rails_helper'
RSpec.describe Admiinistrator, type: :model do
 describe "#password=" do
   example "文字列を与えると、hashed_passwordは長さ60の文字列になる" do
     # Administratorインスタンスを作成する
     member = Admiinistrator.new
     # passwordに文字列を入れるだけでハッシュ値化されることを確認したい
     member.password = "baukis"
     
     # hashed_passwordは文字列である
     expect(member.hashed_password).to be_kind_of(String)
     
     # hashed_passwordの長さは60固定である
     expect(member.hashed_password.size).to eq(60)
   end
   
   example "nilを与えると、hashed_passwordはnilになる" do
     # Administratorインスタンスを作成し、初期値を与える
     member = Admiinistrator.new(hashed_password: "x")
     
     # パスワードにnilをセットしたときの挙動を見たい
     member.password = nil
     
     # nilであることを期待する
     expect(member.hashed_password).to be_nil
   end
 end
end