Rails.application.routes.draw do
  # LOG IN & SIGN UP ROUTES
  devise_for :recruiters
  devise_for :candidates

  # HOME PAGE ROUTE
  root to: 'pages#home'

  # JOB OFFERS ROUTES
  # :index => "as a recruiter, I can see all job offers made by my company"
  # :new & :create => "As a recruiter I can CREATE an offer"
  # :show => "As a candidate, I can view the offer while I am applying to it"
  resources :job_offers, only: [:index, :new, :create, :show] do

    # JOB APPLICATIONS ROUTES
    # job_applications routes must be nested in job_offers => it's the only way we can display all job_offers associated to an offer
    # :index => "As a recruiter I can VIEW profiles (candidate) associated to an offer"
    # :show => "As a recruiter, I can SEE a job application to one of my job offers && As a candidate, I can SEE my application as an employer"
    # :new & :create => "As a candidate I can APPLY to a job offer" // QUESTION: how to make the 'new' page fit on two pages?
    # :destroy => "As a recruiter I can REJECT (update) a profil (candidate) associated to an offer"
    resources :job_applications, only: [:index, :show, :new, :create, :destroy]

  end

  # CANDIDATES ROUTES
  # :show, :edit, & :update => "As a candidate, I can edit my basic information (name, phone_number,..)""
  resources :candidates, only: [:show, :edit, :update]


end
