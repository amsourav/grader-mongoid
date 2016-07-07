Rails.application.routes.draw do

  resources :grades
  resources :jobs do
    get 'grade'
    post 'grade_submit'
    get 'home'
  end

  resources :courses do
    resources :exams do
      member do
        get 'upload_doc'
        get 'attendance_sheet'
        get 'see_grade'
        get 'publish_grade'
        post 'upload_doc_submit'
        post 'upload_attendance_sheet'
      end
<<<<<<< HEAD
    end

    member do
      get 'student_roster'
      post 'upload_student_roster'
      post 'add_teacher'
=======
      resources :questions, shallow: true
      resources :jobs, only: [:index, :show] do
        member do
          post 'post_grade'
          patch 'patch_grade'
        end
      end
>>>>>>> test_paper_processor
    end
  end
  devise_for :students
  devise_for :teachers
  get 'home/index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
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
