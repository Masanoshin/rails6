class Admin::TopController < Admin::Base
  skip_before_action :authorize

  def index
    # raise IpAddressRejectedvs
    # render action: "index" 省略可
    if current_admiinistrator
      render action: "dashboard"
    else
      render action: "index"
    end
  end
end
