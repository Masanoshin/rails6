require "spec_helper"

describe String do
  describe "#<<" do
    # example "文字の追加" do 以下のitを使用しても動作する
    it "append a charcter" do
      s = "ABC"
      s << "D"
      expect(s.size).to eq(4)
    end

    it "nillの追加" do #エラーが出る
      pending("調査中") #保留にできる、忙しい時などに使う
      s = "ABC"
      s << "nill"
      expect(s.size).to eq(4)
    end

    example "文字の追加" do #エラーが出る
      s = "ABC"
      s << "D"
      expect(s.size).not_to eq(5)
    end

    
    
  end
end