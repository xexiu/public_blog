Rails.application.routes.draw do
  root "posts#index"
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'html_css' => 'posts#html_css'
  get 'html_css/:id' => 'posts#show', as: 'html_css_show'
  get 'javascript' => 'posts#javascript'
  get 'javascript/:id' => 'posts#show', as: 'javascript_show'
  get 'ruby' => 'posts#ruby'
  get 'ruby/:id' => 'posts#show', as: 'ruby_show'
  get 'void' => 'posts#void'
  get 'void/:id' => 'posts#show', as: 'void_show'
  get '/about', to: 'pages#about'
  get '/markdown', to: 'pages#markdown'
  
  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all # The "match" method is used to match a URL to one or more routes. It’s a bit more flexible than for instance the "get" method because you can configure it to be triggered in conjunction with any matching route and HTTP method as opposed to for instance just a route matching the get method. You can pass specific HTTP methods into the via option, however we want to match routes in conjunction with any HTTP method, and so I’ve passed all into via.
  
  get 'tags/:tag', to: 'posts#index', as: "tag"
  
  resources :activities
  resources :users
  get '/users/(:comment)', to: 'users#show', as: 'autor'
  
  resources :posts do
    collection do
      put :approve
    end
    member do
      put 'like', to: 'posts#upvote'
      put 'dislike', to: 'posts#downvote'
    end
    get :autocomplete_tag_name, :on => :collection
    get :autocomplete_post_title, :on => :collection
    resources :comments do
      resources :comments
    end
  end
  
  get '/posts/:id', to: 'posts#show', as: 'comment_post'
  get '/posts/:post_id/comments/:id', to: 'comments#show', as: 'comment_reply'
  get '/posts/:post_id/comments/:comment_id/comments/:id', to: 'comments#show', as: 'comment_reply_reply'
  
end

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
