# http://viget.com/extend/using-routing-constraints-to-root-your-app
class AuthConstraint
  def matches?(request)
    request.session['user_id'].present?
  end
end

Happycompany::Application.routes.draw do

  get 'auth/xing/callback'    => 'sessions#create'
  get 'auth/failure'          => redirect('/')
  get 'signout'               => 'sessions#destroy', as: 'signout'

  post 'show_company'         => 'static#show_company'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get ':action' => 'static#:action'

  # You can have the root of your site routed with "root"
  root "static#dashboard", as: :auth_root, constraints: AuthConstraint.new

  root 'static#welcome'


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
