require "rails_helper"

RSpec.describe StaffMenber, type: :model do
  describe "#password=" do
    example "文字列を与えると、hashed_passwordは長さ60の文字列になる" do
      member = StaffMenber.new
      member.password = "basukis"
      expect(member.hashed_password).to be_kind_of(String)
      expect(member.hashed_password.size).to eq(60)
    end

    example "nillを与えると、hashed_passwordはnilになる" do
      member = StaffMenber.new(hashed_password: "X")
      member.password = nil
      expect(member.hashed_password).to be_nil
    end
  end
end
