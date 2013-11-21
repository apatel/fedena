Fedena::Application.routes.draw do
  resources :grading_levels
  resources :ranking_levels do
    collection do
  get :edit_ranking_level
  post :edit_ranking_level
  get :update_ranking_level
  post :update_ranking_level
  get :delete_ranking_level
  post :delete_ranking_level
  get :ranking_level_cancel
  post :ranking_level_cancel
  get :create_ranking_level
  post :create_ranking_level
  get :change_priority
  post :change_priority
  end
  
  
  end

  resources :class_designations
  resources :class_timings
  resources :subjects
  resources :attendances do
    collection do
  get :daily_register
  get :subject_wise_register
  end
  
  
  end

  resources :employee_attendances
  resources :attendance_reports
  resources :cce_exam_categories
  resources :assessment_scores do
    collection do
  get :exam_fa_groups
  get :observation_groups
  end
  
  
  end

  resources :cce_settings do
    collection do
  get :basic
  get :scholastic
  get :co_scholastic
  end
  
  
  end

  resources :scheduled_jobs, :except => [:show]
  resources :fa_groups do
    collection do
  get :update_fa_criteria
  post :update_fa_criteria
  post :destroy_fa_criteria
  get :assign_fa_groups
  post :assign_fa_groups
  get :reorder
  post :reorder
  get :new_fa_criteria
  post :new_fa_criteria
  get :create_fa_criteria
  post :create_fa_criteria
  get :edit_fa_criteria
  post :edit_fa_criteria
  end
  
  
  end

  resources :fa_criterias do
  
  
      resources :descriptive_indicators do
    
    
          resources :assessment_tools
    end
  end

  resources :observations do
  
  
      resources :descriptive_indicators do
    
    
          resources :assessment_tools
    end
  end

  resources :observation_groups do
    collection do
  get :assign_courses
  post :assign_courses
  get :set_observation_group
  post :set_observation_group
  end
    member do
  get :update_observation
  post :update_observation
  post :destroy_observation
  get :reorder
  post :reorder
  get :new_observation
  post :new_observation
  get :create_observation
  post :create_observation
  get :edit_observation
  post :edit_observation
  end
  
  end

  resources :cce_weightages do
    collection do
  get :assign_weightages
  post :assign_weightages
  end
    member do
  get :assign_courses
  post :assign_courses
  end
  
  end

  resources :cce_grade_sets do
  
    member do
  get :new_grade
  post :new_grade
  get :edit_grade
  post :edit_grade
  get :update_grade
  post :update_grade
  post :destroy_grade
  end
  
  end

  match 'courses/manage_course' => 'courses#manage_course', :as => :feed
  match 'courses/manage_batches' => 'courses#manage_batches', :as => :feed
  resources :courses do
    collection do
  get :create_batch_group
  post :create_batch_group
  get :destroy_subject_amount
  post :destroy_subject_amount
  get :edit_batch_group
  post :edit_batch_group
  get :update_batch_group
  post :update_batch_group
  get :delete_batch_group
  post :delete_batch_group
  get :assign_subject_amount
  post :assign_subject_amount
  get :grouped_batches
  post :grouped_batches
  get :edit_subject_amount
  post :edit_subject_amount
  end
  
  
  end

  resources :batches do
    collection do
  get :batches_ajax
  end
  
      resources :exam_groups
    resources :elective_groups
  end

  resources :exam_groups do
  
  
      resources :exams do
    
        member do
    post :save_scores
    end
    
    end
  end

  resources :timetables do
  
  
      resources :timetable_entries
  end

  match '/' => 'user#login'
  match 'assessment_scores/exam/:exam_id/fa_group/:fa_group_id' => 'assessment_scores#fa_scores', :as => :fa_scores
  match 'assessment_scores/batch/:batch_id/observation_group/:observation_group_id' => 'assessment_scores#observation_scores', :as => :observation_scores
  match 'scheduled_jobs/:job_object/:job_type' => 'scheduled_jobs#index', :as => :scheduled_task
  match 'scheduled_jobs/:job_object' => 'scheduled_jobs#index', :as => :scheduled_task_object
  match '/:controller(/:action(/:id))'
  match ':controller/:action' => '#index'
  match ':controller/:action/:id/:id2' => '#index'
end
