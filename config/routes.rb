Rails.application.routes.draw do
  # LOG IN & SIGN UP ROUTES
  devise_for :recruiters
  devise_for :candidates, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  # authenticated :recruiter do
  #     root 'job_offers#index', as: :authenticated_root
  #   end

  # HOME PAGE ROUTE
  root to: 'pages#home'

  # JOB OFFERS ROUTES
  get '/search', to: 'pages#search', as: 'search' # search for job offers
  # :index => "as a recruiter, I can see all job offers made by my company"
  # :new & :create => "As a recruiter I can CREATE an offer"
  # :show => "As a candidate, I can view the offer while I am applying to it"
  resources :job_offers, only: [:index, :new, :create, :show] do


    # JOB APPLICATIONS ROUTES
    # job_applications routes must be nested in job_offers => it's the only way we can display all job_applications associated to an offer
    # :index => "As a recruiter I can VIEW profiles (candidate) associated to an offer" // will change to a custom 'dashboard route for recruiters'
    # :show => "As a recruiter, I can SEE a job application to one of my job offers && As a candidate, I can SEE my application as an employer"
    # :edit => "As a candidate I can APPLY to a job offer" // QUESTION: how to make the 'new' page fit on two pages? ANSWSER: js
    resources :job_applications, only: [:index, :show, :edit, :update, :new] do

      get 'toto'
      get 'toto', on: :member
      get 'toto', on: :collection

      post 'submit', on: :member

      collection do #??????
        delete :batch_deletion
      end

      member do
        get 'submit'
      end

    end
  end

  resources :job_applications, only: [] do
    get 'conversation', on: :member
    resources :messages, only: [:create]
  end

  # EXPERIENCES ROUTES
  resources :experiences, only: [:new, :create, :edit, :update, :destroy]

  # EDUCATIONS ROUTES
  resources :educations, only: [:new, :create, :edit, :update, :destroy]

  # LANGUAGES ROUTES
  resources :languages, only: [:new, :create, :edit, :update, :destroy]


  # CANDIDATES ROUTES
  # :show, :edit, & :update => "As a candidate, I can edit my basic information (name, phone_number,..)""
  resources :candidates, only: [:show, :edit, :update]


  # DEMO JOB OFFER
  get 'demo', to: 'pages#demo'

end
