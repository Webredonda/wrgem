class WradminGenerator < Rails::Generators::Base

  source_root File.expand_path('../template',__FILE__)

  def generate_wradmin

    # INSTALANDO AS GEMS
    run "rails generate devise:install"
    run "rails generate simple_form:install"
    run "rails generate redactor:install"

    # INCLUINDO ARQUIVOS DA PASTA LIB
    remove_dir "lib"
    directory "lib", "lib"

    # COPIANDO AS VIEWS
    directory "views/admin", "app/views/admin"
    directory "views/layouts", "app/views/layouts"
    directory "views/users", "app/views/users"

    # COPIANDO OS ASSETS (javascripts e  stylesheets)
    directory "assets/javascripts", "app/assets/javascripts"
    directory "assets/stylesheets", "app/assets/stylesheets"
    directory "assets/images", "app/assets/images"

    # COPIANDO OS CONTROLLERS
    copy_file "controllers/admin_controller.rb", "app/controllers/admin_controller.rb"
    directory "controllers/admin", "app/controllers/admin"
    directory "controllers/users", "app/controllers/users"

    # COPIANDO LOCALES
    remove_file "config/locales/pt-br.yml"
    copy_file "locales/pt-br.yml", "config/locales/pt-br.yml"

    remove_file "config/locales/simple_form.pt-br.yml"
    copy_file "locales/simple_form.pt-br.yml", "config/locales/simple_form.pt-br.yml"

    # COPIANDO AS MIGRATES
    directory "migrate", "db/migrate"

    # COPIANDO OS MODELS
    directory "models/admin", "app/models/admin"
    copy_file "models/admin.rb", "app/models/admin.rb"
    copy_file "models/user.rb", "app/models/user.rb"

    # COPIANDO AS IMAGENS DA PASTA PUBLIC
    directory "public/images", "public/images"
    directory "public/img", "public/img"

    # COPIANDO OS UPLOADERS
    # directory "uploaders", "app/uploaders"

    remove_file "app/uploaders/redactor_rails_document_uploader.rb"
    remove_file "app/uploaders/redactor_rails_picture_uploader.rb"

    copy_file "uploaders/avatar_user_uploader.rb", "app/uploaders/avatar_user_uploader.rb"
    copy_file "uploaders/redactor_rails_document_uploader.rb", "app/uploaders/redactor_rails_document_uploader.rb"
    copy_file "uploaders/redactor_rails_picture_uploader.rb", "app/uploaders/redactor_rails_picture_uploader.rb"




    # ADICIONANDO A ROTA
    route "
  get 'admin' => 'admin#index'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

  get 'admin/users/new' => 'admin/users#new'
  get 'admin/users/:id' => 'admin/users#view'
  get 'admin/users/:id/edit' => 'admin/users#edit'

  devise_scope :user do
  get 'logout' => 'users/sessions#destroy'
  post 'logout' => 'users/sessions#destroy'
  end

  namespace :admin do
  resources :users
  resources :contacts
  end
  "

    # RODANDO AS MIGRATES
    run "rake db:migrate"

  end

end
