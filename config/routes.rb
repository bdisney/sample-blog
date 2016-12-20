Rails.application.routes.draw do
  get 'home/index'

  # get 'contacts' => 'contacts#new' первый способ вывода страницы при обновлении
  resources :articles
  resource :contacts, only: [:new, :create], path_names: {:new => ''}
  resource :terms, only: [:show], path_names: {:show => ''}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
