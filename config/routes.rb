Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/articles' => 'articles#index'
  # #get 'articles/:id' => 'articles#show'
  
  # get 'articles/new' => 'articles#new'
  # post 'articles' => 'articles#create'

  # get 'articles/:id/edit' => 'articles#edit', as :edit_article
  # put 'articles:id'

  resources :articles

end
 