class ApplicationController < ActionController::Base
   # レイアウトをどのメソッドで決めるか
  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

 
  include ErrorHandlers if Rails.env.production?

  # レイアウトを決めるメソッド
  private def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)})
      Regexp.last_match[1]
    else
      "customer"
    end
  end

end
