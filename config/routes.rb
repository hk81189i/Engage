AHtest::Application.routes.draw do

  get "marketing/dashboard"
  resources :oncourse_exercises
  get 'research/new', to: 'oncourse_exercises#new'
  
  resources :pconfirms

  resources :histories


  get "/sales/sendmail"
  get "/pplans/sendmail"


  resources :lead_statuses

  resources :contacts
  get "/sales/salecomplete"
  post "/sales/salecomplete"
  get "/sales/dashboard"

  post "infusionsoft/batchshifted"
  post "infusionsoft/newsale"
  post "infusionsoft/getbatch"
  post "infusionsoft/newlead"
  post "infusionsoft/lead_reassign"
  post "infusionsoft/lead_status"
  get "admins/index"
post 'invoices/genetate/:id' => 'invoices#generate'
get 'invoices/genetate/:id' => 'invoices#generate'


  resources :owners
  resources :batches
  resources :dashboard

  resources :invoices


  devise_for :admins
  resources :collections do
collection { get :invoice}
collection { post :invoice}
end
  resources :sales do
collection { get :manualadd}
collection { post :manualadd}
end

  resources :users

  resources :cashtables


  resources :pplans do 
    collection { post :monthlyreport }
    collection { get :monthlyreport }
    collection { get :batchrevreport }
    collection { post :batchrevreport }
    collection { post :report_one }
    collection { get :report_one}
    collection { get :report_two}
    collection { post :report_two }
    collection { get :report_three}
    collection { post :report_four}
    collection { get :report_four}
 
  end
  get 'pplans/:id/new' => 'pplans#new'

  resources :payment_plans 
  get 'payment_plans/:id/report' => 'payment_plans#movetocash'
  get 'payment_plans/:id/reportone' => 'payment_plans#reportone'
  get 'cashtables/:id/cashreportone' => 'cashtables#cashreportone'


  resources :bdms

  resources :leads

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 root  'dashboard#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
