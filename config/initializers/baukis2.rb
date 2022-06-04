Rails.application.configure do
  #このconfigはRails::Application::Configurationクラスのインスタンスを返すメソッド
  config.baukis2 = { 
    staff: {host: "baukis2.example.com", path:""},
    admin: {host: "baukis2.example.com", path: "admin"},
    customer: {host: "example.com", path: "mypage"}
  }
end
 #Railsアプリケーションの中では次の式でこのハッシュにアクセスできます
#  Rails.application.config.baukis2すなわち職員トップページのホスト名(baukis2.example.com)を参照したければ次のように書けばいいわけです
# Rails.application.config.baukis2[:staff][:host]