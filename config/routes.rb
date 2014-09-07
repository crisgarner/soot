DisruptHack::Application.routes.draw do

  resources :testing_s

  root :to => 'static#index' 
  #twilio
  post 'twilio/request_sms' => 'twilio#request_sms'
  get  'twilio/request_sms' => 'twilio#request_sms'
  #statics
  get "home" => "static#home"
  #sessions
  get 'auth/:provider/callback' => 'sessions#create'
  post 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout'=> 'sessions#destroy', as: 'signout'
  #contacts
  get "/contacts/:importer/callback" => "contacts#contacts_callback"
  post "/contacts/:importer/callback" => "contacts#contacts_callback"
  post "/contacts/save_contacts" => "contacts#save_contacts"
  get "/contacts/show_all" => "contacts#show_all"
  get "/contacts/remove/:contact_id" => "contacts#remove"
  get "/contacts/edit/:contact_id" => "contacts#edit"
  get "/contacts/new" => "contacts#new"
  post "/contacts/save_new" => "contacts#save_new"
  post "/contacts/update_contact/:contact_id" => "contacts#update_contact"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
