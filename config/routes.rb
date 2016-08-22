Rails.application.routes.draw do
  devise_for :recruiters
  devise_for :candidates
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
