class WrstartGenerator < Rails::Generators::Base

  source_root File.expand_path('../template',__FILE__)
  argument :app_name, :type => :string, :default => "app_name"

  def generate_wrstart
    remove_file "Gemfile"
    copy_file "Gemfile"

    run "bundle"

    remove_file "config/database.yml"
    template "database.yml", "config/database.yml"
    run "rake db:create"

    run "rails g start:bower"
    run "rails g start:heroku"
    run "rails g start:heroku_wake_up"
    run "rails g start:locales"
    run "rails g start:slim"
    run "rails g start:spec_helpers"
    run "rails g start:unicorn"

    application do
     "

      Rails.application.assets.register_engine('.slim', Slim::Template)
      Slim::Engine.set_default_options format: :html5
      config.i18n.default_locale = 'pt-BR'
      config.time_zone = 'Brasilia'

      config.generators do |g|
        g.assets            false
        g.helper            false
        g.test_framework    nil
        g.jbuilder          false
      end
      "
    end

    # remove_file "app/views/layouts/application.html.erb"

    copy_file "better_errors.rb", "config/initializers/better_errors.rb"

    remove_dir "app/assets/javascripts"
    copy_dir "javascripts", "app/assets/javascripts"

    # remove_file "app/assets/stylesheets/application.css"
    # copy_file "application.sass", "app/assets/stylesheets/application.sass"

    # copy_file "font-awesome.css", "app/assets/stylesheets/font-awesome.css"

    # directory 'fonts', 'app/assets/fonts'

    # remove_file "app/helpers/application_helper.rb"
    # copy_file "application_helper.rb", "app/helpers/application_helper.rb"

    # copy_file "redactor-rails.css", "app/assets/stylesheets/redactor-rails.css"

    # copy_file "layout.sass", "app/assets/stylesheets/layout.sass"

    # run "bower install bourbon"
    # run "bower install animate.css"

    # run "rails g controller home index"

    # remove_file "app/views/home/index.html.slim"
    # copy_file "index.html.slim", "app/views/home/index.html.slim"


    # route "root 'home#index'"

    # gsub_file 'config/environments/production.rb', 'config.serve_static_assets = false', 'config.serve_static_assets = true'
    # gsub_file 'config/environments/production.rb', 'config.assets.compile = false', 'config.assets.compile = true'

  end

end
