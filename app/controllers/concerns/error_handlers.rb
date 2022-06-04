module ErrorHandlers
  extend ActiveSupport::Concern
  
  # エラーがあったときにどのメソッドを呼び出すかを決める
  included do
    rescue_from StandardError, with: :rescue500
    rescue_from ApplicationController::Forbidden, with: :rescue403
    rescue_from ApplicationController::IpAddressRejected, with: :rescue403
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  end
  
  private def rescue400(e)
    render "errors/bad_repuest", status: 400
  end
  # ForbiddenエラーかIpAddressRejectedがあったときに呼び出されるメソッド
  private def rescue403(e)
    @exception = e
    render "errors/forbidden", status: 403
  end
  
  # RecordNotFoundエラーがあったときに呼び出されるメソッド
  private def rescue404(e)
    render "errors/not_found", status: 404
  end
  # StandardErrorがあったときに呼び出されるメソッド
  private def rescue500(e)
    render "errors/internal_server_error", status: 500
  end
 end