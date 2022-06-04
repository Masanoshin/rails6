class Staff::SessionsController < Staff::Base
  skip_before_action :authorize

  def new
    if current_staff_menber
      # binding.pry
      redirect_to :staff_root
    else
      #フォームオブジェクトを作成しそれをインスタンス変数にセットしています ERB側ではこれをform_withメソッドの引数にしてログインフォームを生成します
      @form = Staff::LoginForm.new

      render action: "new"
    end
  end

  def create  
    # @form = Staff::LoginForm.new(params[:staff_login_form].permit!)
    @form = Staff::LoginForm.new(staff_menber_params)
    if @form.email.present?
      #find_byで使用している(email) = ?のはてなはプレイスホルダーで第二引数である@formがこの部分に差し込まれる
      staff_menber = StaffMenber.find_by("LOWER(email) = ?", @form.email.downcase)
    end

    # if staff_menber
    if Staff::Authenticator.new(staff_menber).authenticate(@form.password)
      # session[:staff_menber_id] = staff_menber.id
      # flash.notice = "ログインしました。"
      # redirect_to "http://localhost:3000/staff/login"
      if staff_menber.suspended?
        #Staffmenberオブジェクトにeventsメソッドが定義された
        staff_menber.events.create!(type: "rejected")
        flash.now.alert = "アカウントが停止されています。"
        render action: "new"
      else
        session[:staff_menber_id] = staff_menber.id
        session[:last_access_time] = Time.current
        staff_menber.events.create!(type: "logged_in")
        flash.notice = "ログインしました。"
        redirect_to :staff_root 
        # http://localhost:3000/staff/login
      end
    else
      #nowをつけるとアクション終了時に消えるようになる
      flash.now.alert = "メールアドレスが正しくありません"   
      render action: "new"
    end
  end

  def destroy
    #同じ職員がログアウトボタンを連打した時などすでにログアウトした状態でアクションdestoryが呼ばれる可能性があるのでifで囲んでいる
    if current_staff_menber
      current_staff_menber.events.create!(type: "logged_out")
    end
    session.delete(:staff_menber_id)
    flash.notice = "ログアウトしました。"
    redirect_to :staff_root
  end

  private def staff_menber_params
    params.require(:staff_login_form).permit(:email, :password)
  end

end
