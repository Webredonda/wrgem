class WradminGenerator < Rails::Generators::Base

  source_root File.expand_path('../template',__FILE__)

  def generate_wradmin

    # INCLUINDO A GEM
    gemfile "gem 'redactor-rails', '~> 0.4.5'"
    run "bundle update"

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
    directory "views/user", "app/views/user"

    # COPIANDO OS ASSETS (javascripts e  stylesheets)
    directory "assets/javascripts", "app/assets/javascripts"
    directory "assets/stylesheets", "app/assets/stylesheets"

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
    copy_file "models/admin/admin.rb", "app/models/admin/admin.rb"
    copy_file "models/admin/user.rb", "app/models/admin/user.rb"

    # COPIANDO AS IMAGENS DA PASTA PUBLIC
    directory "public/images", "public/images"
    directory "public/img", "public/img"
    copy_file "public/favicon.ico", "public/favicon.ico"


    # COPIANDO OS UPLOADERS
    directory "uploaders", "app/uploaders"

    # ADICIONANDO A ROTA
    route do
      "

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
    end

    # RODANDO AS MIGRATES
    run "rake db:migrate"

  end

end
