Rails.application.routes.draw do

  resources :evaluates
  resources :payments
  resources :categories
  root 'bills#new'

  resources :ingredients
  resources :items
  resources :orders
  resources :bills

  get '/menu', to: "items#menu"
  match 'order_item', to: 'items#order_item', via: [:get, :post]
  post 'add_order', to: 'orders#add_order'
  match 'edit_order_items', to: 'items#edit_order_items', via: [:get, :post]
  post 'amount_change', to: 'ingredients#amount_change'
  post 'back_to_menu', to: 'orders#back_to_menu'
  match 'close_bill', to: 'bills#close_bill', via: [:get, :post]
  match 'pay_bill', to: 'bills#pay_bill', via: [:get, :post]
  match 'payment_type', to: 'payments#payment_type', via: [:get, :post]
  match 'payment_type2', to: 'payments#payment_type2', via: [:get, :post]
  match 'payment_instructions', to: 'payments#payment_instructions', via: [:get, :post]
  match 'end_eval', to: 'evaluates#end_eval', via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
