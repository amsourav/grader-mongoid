Rails.application.routes.draw do

  resources :jobs
  get 'home/index'
  root 'home#index'

  devise_for :students
  devise_for :teachers

  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  resources :courses do
    member do
      get 'student_roster'
      post 'upload_student_roster'
    end
    resources :exams do
      member do
        get 'manage'
        get 'send_reminder_mail'
        patch 'upload_student_attendance_sheet'
        patch 'upload_test_papers'
      end
      resources :questions, shallow: true
    end
  end
end
