class Admin::Base < ApplicationController
  before_action :authorize
  before_action :check_account
  # before_action :check_timeout
  helper_method :current_admiinistrator


  private def current_admiinistrator
    if session[:admiinistrator_id]
      num = String(session[:admiinistrator_id])
      # @current_staff_menber = StaffMenber.find_by(id: num)
      @current_admiinistrator ||= Admiinistrator.find_by(id: session[:admiinistrator_id])
    end  
    
  end


  private def authorize
    unless current_admiinistrator
      flash.notice = "管理者としてログインしてください"
      redirect_to :admin_login        
    end
  end

  private def check_account
    if current_admiinistrator && current_admiinistrator.suspended?
      session.delete(:admiinistrator_id)
      flash.notice = "アカウントが無効になりました"
      redirect_to :admin_login
    end
  end

  # TIMEOUT = 60.minutes

  # private def check_timeout

  #   if current_admiinistrator
  #     binding.pry
  #     if session[:last_access_time] >= TIMEOUT.ago
  #       session[:last_access_time] = Time.current
  #     else
  #       session.delete[:admiinistrator_id]
  #       flash.alert = "セッションがタイムアウトしました"
  #       redirect_to :admin_login
  #     end
  #   end

  # end



end