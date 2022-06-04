require "rails_helper"

describe Staff::Authenticator do
  describe "#authenticate" do
    example "正しいパスワードならtrueを返す" do
      #変数mにはファクトリーで割り当てらいる属性値を持つStaffMrnberオブジェクトがセットされまうす、データベースには保存されません
      m = build(:staff_menber)
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    example "間違ったパスワードならfalseを返す" do
      m = build(:staff_menber)
      expect(Staff::Authenticator.new(m).authenticate("xt")).to be_falsey
    end

    example "パスワードが未設定ならfalseを返す" do
      #特定の属性だけ変更することもできる
      m = build(:staff_menber, password: nil)
      expect(Staff::Authenticator.new(m).authenticate("nil")).to be_falsey
    end

    example "停止フラグが間違っていたらfalseを返す" do
      m = build(:staff_menber, suspended: true)
      expect(Staff::Authenticator.new(m).authenticate("nil")).to be_falsey
    end


  end

end