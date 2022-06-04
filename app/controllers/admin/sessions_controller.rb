class Admin::SessionsController < Admin::Base
  skip_before_action :authorize

  def new
    if current_admiinistrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: "new"
    end
  end

  def create
    # @form = Admin::LoginForm.new(params[:admin_login_form].permit!)
    @form = Admin::LoginForm.new(login_form_params)
    if @form.email.present?
      
      admiinistrator = Admiinistrator.find_by("LOWER(email) = ?" , @form.email.downcase)
    end

    if Admin::Authenticator.new(admiinistrator).authenticate(@form.password)
      if admiinistrator.suspended?
        flash.now.alert = "アカウントが停止されています"
        render action: "new"
      else
        session[:admiinistrator_id] = admiinistrator.id
        flash.notice = "ログインしました"
        redirect_to :admin_root
      end
      
    else
      flash.now.alert = "メールアドレスが正しくありません"
      render action: "new"
    end
  end

  def destroy
    session.delete(:admiinistrator_id)
    flash.notice = "ログアウトしました"
    redirect_to :admin_root
  end

  private def login_form_params
    # requireメソッドの戻り値はActionController::Parameterクラス(hashの子孫クラス)のインスタンスです
    # {admin_login_form: {email: "test@exmaple.com", password: "foobar"}}というハッシュをもているとparams.require(:admin_login_form)はActionController::Parameterオブジェクトを返す
    # {email: "test@example.com", password: "foobar"}このオブジェクトに対してpermitをメソッドを呼び出すと引数に指定されていないパラメーターが除去されます
    params.require(:admin_login_form).permit(:email, :password)
  end
end

