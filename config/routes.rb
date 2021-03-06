ActionController::Routing::Routes.draw do |map|

  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.recover_password 'recover_password', :controller => 'user_sessions', :action => 'recover_password'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.resources :user_sessions, :collection => {:recover_password => :any}
  map.resources :users, :collection => {:newpassword => :any, :createnewpassword => :post}

  map.resource :main
  map.resources :contents
  map.connect '/page/*urlname', :controller => "contents", :action => "show"
  map.root :controller => "main"
  map.resources :comments
  map.resources :contacts
  map.resources :debates, :collection => {:mydebates => :get, :search => :get}

  map.resources :debates do |debates|
    debates.resources :comments
  end

  map.namespace(:admin) do |admin|
    admin.root :controller => "debates"
    admin.resources :debates, :collection => {:check => :get}
    admin.resources :comments
    admin.resources :users, :collection => {:edit_admin => :get}
    admin.resources :contents
    admin.resources :contacts
  end



  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

