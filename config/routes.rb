BackApp::Application.routes.draw do
  resources :tags


  get "add_admin/users"

  get "add_admin/posts"

  get "add_admin/add_admin"

  get "add_admin/add_category"

  get "login/show"

  get "login/login"
  get "login/remove"

  get "posts/vote"
  get "comments/vote"
  get "admin/posts"
  get "admin/users"
  get "admin/edit_admin"
  get "admin/admin_home"
  get "admin/user_impersonate"
  get "posts/search"

  resources :comment_votes


  resources :post_votes


  resources :comments


  resources :posts


  resources :categories


  resources :users

  resources :login

  match'/login/login' => 'login#login'
  post "login/login"

  match'/login/show' => 'login#show'
  get "login/show"

  match 'login/remove' => 'login#remove'
  get "login/remove"

  match 'posts/vote'  => 'posts#vote'
  post "posts/vote"

  match 'comments/vote' => 'comments#vote'
  post "comments/vote"

  match 'admin/posts' => 'admin#posts'
  post "admin/posts"

  match 'admin/show_admin_type' => 'admin#show_admin_type'
  get "admin/show_admin_type"

  match 'admin/new' => 'admin#new'
  post "admin/new"

  match 'admin/users' => 'admin#users'
  post "admin/users"

  match 'admin/create' => 'admin#create'
  post "admin/create"

  match 'admin/view_admin' => 'admin#view_admin'
  post "admin/view_admin"

  match 'admin/delete_admin' => 'admin#delete_admin'
  post "admin/delete_admin"
  match 'admin/delete_post' => 'admin#delete_post'
  post "admin/delete_post"

  match 'admin/delete_user' => 'admin#delete_user'
  post "admin/delete_user"

  match 'admin/add_category' => 'admin#add_category'
  post "admin/add_category"

  match 'admin/view_category' => 'admin#view_category'
 get "admin/view_category"

  match 'admin/user_impersonate' => 'admin#user_impersonate'
  get "admin/user_impersonate"

  match 'admin/stop_impersonate' => 'admin#stop_impersonate'
  get "admin/stop_impersonate"

  match 'posts/search' => 'posts#search'
  get "posts/search"

  match 'posts/display_search' => 'posts#display_search'
  get "posts/display_search"

  match 'posts/index' => 'posts#index'
  post "posts/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :add_admin do
  #     # Directs /add_admin/products/* to Admin::ProductsController
  #     # (app/controllers/add_admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'posts#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
