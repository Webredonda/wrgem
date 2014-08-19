class WrstartGenerator < Rails::Generators::Base

  source_root File.expand_path('../templates',__FILE__)
  argument :app_name, :type => :string, :default => "app_name"

  def generate_wrstart
    remove_file "Gemfile"
    copy_file "Gemfile"

    run "bundle install"

    remove_file "config/database.yml"
    template "database.yml", "config/database.yml"
    run "rake db:create"

    copy_file ".bowerrc"

    run "bundle exec guard init"
    remove_file "Guardfile"
    copy_file "Guardfile"

    run "rails g start:slim"
    run "rails g start:heroku"
    run "rails g start:heroku_wake_up"
    run "rails g start:unicorn"

    run "rails g start:locales"


    application do
     "config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

      config.generators.stylesheet_engine = :sass
      config.assets.initialize_on_precompile = false


      config.generators do |g|
        g.assets            false
        g.helper            false
        g.view_specs        false
        g.helper_specs      false
        g.controller_specs  false
      end"
    end

    remove_file "app/views/layouts/application.html.erb"
    run "rails g foundation:install"
    run "rails g simple_form:install --foundation"

    copy_file "better_errors.rb", "config/initializers/better_errors.rb"

    remove_file "app/views/layouts/application.html.erb"
    template "application.html.slim", "app/views/layouts/application.html.slim"

    remove_file "app/assets/javascripts/application.js"
    copy_file "application.coffee", "app/assets/javascripts/application.coffee"

    remove_file "app/assets/stylesheets/application.css"
    copy_file "application.sass", "app/assets/stylesheets/application.sass"

    copy_file "font-awesome.css", "app/assets/stylesheets/font-awesome.css"

    directory 'fonts', 'app/assets/fonts'

    remove_file "app/helpers/application_helper.rb"
    copy_file "application_helper.rb", "app/helpers/application_helper.rb"

    copy_file "redactor-rails.css", "app/assets/stylesheets/redactor-rails.css"

    copy_file "layout.sass", "app/assets/stylesheets/layout.sass"

    run "bower install bourbon"
    run "bower install animate.css"

    run "rails g controller home index"

    remove_file "app/views/home/index.html.slim"
    copy_file "index.html.slim", "app/views/home/index.html.slim"


    route "root 'home#index'"

    gsub_file 'config/environments/production.rb', 'config.serve_static_assets = false', 'config.serve_static_assets = true'
    gsub_file 'config/environments/production.rb', 'config.assets.compile = false', 'config.assets.compile = true'

  end

end
