Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # constraints host: "baukis2.example.com" do #hostがbaukis2.example.comの時のみにアクセスできる
    namespace :staff, path: "" do 
    root "top#index"
    get "login" => "sessions#new", as: :login
    # post "session" => "sessions#create", as: :session
    # delete "session" => "sessions#destroy"
    resource :session, only: [:create, :destroy]
    resource :account, except:[:new, :create, :destroy]#なおコントローラ名はstaff/accounts(複数形)となる
  end
# end
  

  namespace :admin do
    root "top#index"
    get "login" => "sessions#new", as: :login
    # post "session" => "sessions#create", as: :session
    # delete "session" => "sessions#destroy"
    # get "staff_menbers" => "staff_menbers#index"
    # get "staff_menbers/:id" => "staff_menbers#show"
    # get "staff_menbers/new" => "staff_menbers#new"
    # get "staff_menber/:id/edit" => "staff_menbers#edit"
    # post "staff_menbers" => "staff_menbers#create"
    # path "staff_menbers/:id" => "staff_menbers#update"
    # delete "staff_menbers/:id" => "staff_menbers#destroy"
    # resources :staff_menbers #上記をまとめきれる
    resource :session, only:[:create, :destroy]
    #ネストされたリソース admin/staff_menbers/:staff_menber_id/staff_events getメソッドで左のURLになる これはある一人の記録を表示する
    resources :staff_menbers do
      resources :staff_events, only: [ :index ]
     end
     #これは全ての職員の記録を観覧する
     resources :staff_events, only: [ :index ]
  end

  namespace :customer do
    root "top#index"
  end
end
