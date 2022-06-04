class Staff::AccountsController < Staff::Base

  def show
    @staff_menber = current_staff_menber
  end

  def edit
    @staff_menber = current_staff_menber
  end

  def update
    @staff_menber = current_staff_menber
    @staff_menber.assign_attributes(staff_menber_params)
    if @staff_menber.save
      flash.notice = "アカウント情報を更新しました"
      redirect_to :staff_account
    else
      render action: "edit"
    end
  end

  private def staff_menber_params
      params.require(:staff_menber).permit(
        :email, :family_name, :given_name, :family_name_kana, :given_name_kana
      )
  end

end
