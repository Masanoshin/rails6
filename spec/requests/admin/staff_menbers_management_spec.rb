require "rails_helper"

describe "管理者による職員管理" do
  let(:administrator){ create(:administrator)}

  describe "新規登録" do
    let(:params_hash) { attributes_for(:staff_menber)}
  end

  describe "更新" do
    let(:staff_menber) {create(:staff_menber)}
    let(:params_hash) {attributes_for(:staff_menber)}
  end
end