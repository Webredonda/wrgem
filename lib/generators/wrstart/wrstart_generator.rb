class WrstartGenerator < Rails::Generators::Base

  source_root File.expand_path('../template',__FILE__)
  argument :app_name, :type => :string, :default => "app_name"

  def generate_wrstart
    remove_file "Gemfile"
    copy_file "Gemfile"

    remove_file "Gemfile.lock"

    run "bundle update"

    remove_file "config/database.yml"
    template "database.yml", "config/database.yml"
    run "rake db:drop"
    run "rake db:create"


    run "rails g start:heroku"
    run "rails g start:heroku_wake_up"
    run "rails g start:locales"

    run "rails g start:unicorn"

    copy_file ".bowerrc", ".bowerrc"

    application do
     "
    Rails.application.assets.register_engine('.slim', Slim::Template)
    Slim::Engine.set_default_options format: :html5
    config.i18n.default_locale = 'pt-BR'
    config.time_zone = 'Brasilia'

    config.assets.precompile += %w(admin.js)
    config.assets.precompile += %w(admin.css)
    config.assets.precompile += %w(contato_mailer.css)
    config.assets.precompile += %w(logo.png)

    config.generators do |g|
      g.assets            false
      g.helper            false
      g.test_framework    nil
      g.jbuilder          false
    end
      "
    end

    remove_file "config/unicorn.rb"
    template "unicorn.rb", "config/unicorn.rb"

    remove_file "config/initializers/timeout.rb"

    remove_file "config/initializers/heroku_wake_up.rb"
    template "heroku_wake_up.rb", "config/initializers/heroku_wake_up.rb"

    copy_file "better_errors.rb", "config/initializers/better_errors.rb"

    remove_dir "app/assets/javascripts"
    directory "javascripts", "app/assets/javascripts"

    remove_dir "app/assets/stylesheets"
    directory "stylesheets", "app/assets/stylesheets"

    remove_dir "vendor"
    directory "vendor", "vendor"

    remove_file "app/views/layouts/application.html.erb"
    copy_file "application.html.slim", "app/views/layouts/application.html.slim"

    directory "shared", "app/views/shared"

    remove_file "app/helpers/application_helper.rb"
    copy_file "application_helper.rb", "app/helpers/application_helper.rb"

    run "rails g controller home index"

    remove_file "app/views/home/index.html.slim"
    copy_file "index.html.slim", "app/views/home/index.html.slim"

    route "root 'home#index'"
    route "get '/sitemap', to: redirect('https://s3-sa-east-1.amazonaws.com/PROJECT_NAME/sitemaps/sitemap.xml.gz')"

    template "sitemap.rb", "config/sitemap.rb"

    run "bundle update"
  end

end
