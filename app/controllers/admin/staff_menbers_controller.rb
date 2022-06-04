class Admin::StaffMenbersController < Admin::Base

  def index
    # 振り仮名を性・名の順にソートしつつstaff_menersテーブルの全てのレコードを取得しStaffMenberオブジェクトの配列としてインスタンス変数@staff_menberにセットしている
    @staff_menbers = StaffMenber.order(:family_name_kana, :given_name_kana)
  end

  def show
    staff_menber = StaffMenber.find(params[:id])
    redirect_to [ :edit, :admin, :staff_menber] #このリダイレクトは"/admin/staff_menerb/id/edit"のURLとなる
  end

  def new
    @staff_menber = StaffMenber.new
  end

  def edit
    @staff_menber = StaffMenber.find(params[:id])
  end

  def create
    @staff_menber = StaffMenber.new(staff_menber_params)
    # params[:staff_menber]はハッシュ構造を返す
    # staff_menber:{
    #   email: "alksjdf@email",password: "foobar",~~~
    # }
    if @staff_menber.save
      flash.notice = "職員アカウントを新規登録しました"
      redirect_to :admin_staff_menbers
    else
      render action: "new"
    end
  end

  def update
    @staff_menber = StaffMenber.find(params[:id])
    @staff_menber.assign_attributes(staff_menber_params)
    # assign_attributesメソッドでモデルオブジェクトの属性を一括設定できます
    if @staff_menber.save
      flash.notice = "職員アカウントを更新しました"
      redirect_to :admin_staff_menbers
    else
      render action: "edit"
    end
  end

  def destroy
    staff_menber = StaffMenber.find(params[:id])
    # destroyとdestroy!の違いは削除前に実行されるコールバックbefore_destroyがfalseを返した時の結果です。前者は戻り値falseを返し後者はActiveRecord::RecordNotDestoryを発生させます
    staff_menber.destroy!
    flash.notice = "職員アカウントを削除しました"
    redirect_to :admin_staff_menbers
  end

  private def staff_menber_params
    params.require(:staff_menber).permit(:emial,:password,:family_name, :given_name, :family_name_kana,:given_name_kana,:start_date,:end_date,:suspended)
  end

end
