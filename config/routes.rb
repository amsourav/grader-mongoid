Rails.application.routes.draw do

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
      resources :jobs, only: [:index, :show] do
        member do
          post 'post_grade'
          patch 'patch_grade'
        end
        collection do
          get 'progress'
        end
      end
    end
  end
end
