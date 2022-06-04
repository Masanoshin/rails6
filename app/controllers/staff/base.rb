class Staff::Base < ApplicationController
  before_action :authorize
  before_action :check_account
  before_action :check_timeout
  # #引数に指定したシンボルと同名のメソッドをヘルパーメソッドとして登録するメソッドでうsつまり。currnet_staff_menberというメソッドを
  # # app/helpers/application_helper.rbに定義するのと同じ効果が得られますこの結果current_staff_menberメソッドをERBないでも使用できるようになります
  helper_method :current_staff_menber
  # #名前空間staffに属する全てのコントローラーにcurrent_staff_menberというprivateメソッドを与えるためstaff::baseというクラスを定義します
  
  private def current_staff_menber

    if session[:staff_menber_id]
      num = String(session[:staff_menber_id])
      
      @current_staff_menber = StaffMenber.find_by(id: num)
    end
  end

  private def authorize
    unless current_staff_menber
      flash.notice = "職員としてログインしてください"
      redirect_to :staff_login
    end
  end

  private def check_account
    if current_staff_menber && !current_staff_menber.active?
      session.delete(:staff_menber_id)
      flash.notice = "アカウントが無効になりました"
      redirect_to :staff_root
    end
  end

  #整数60秒に対してminutesメソッドを呼び出すと3600秒に相当するActiveSupport::Durationオブジェクトが返ってきます
  TIMEOUT = 60.minutes

  private def check_timeout
    if current_staff_menber
      if session[:last_access_time] >= TIMEOUT.ago
        session[:last_access_time] = Time.current
      else
        session.delete[:staff_menber_id]
        flash.alert = "セッションがタイムアウトしました"
        redirect_to :staff_login
      end
    end
  end

end