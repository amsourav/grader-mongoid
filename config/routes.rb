Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'

  devise_for :students
  devise_for :teachers

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :courses do
    member do
      get 'student_roster'
      post 'upload_student_roster'
      post 'add_teacher'
    end
    end
end
