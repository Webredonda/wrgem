class WrstartGenerator < Rails::Generators::Base

  source_root File.expand_path('../templates',__FILE__)
  argument :app_name, :type => :string, :default => "app_name"

  def generate_wrstart

  end

end
