class Staff::TopController < Staff::Base
  skip_before_action :authorize
  def index
    # raise #エラーを引き起こす エラー画面をカスタマイズする時などに使用する
    
    render action: "index" #actionを指定している
  end
end
