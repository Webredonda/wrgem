CarrierWave.configure do |config|
  config.permissions = 0666
  config.directory_permissions = 0777
  config.cache_dir = Rails.root.join 'tmp', 'uploads'
  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:      "AKIAJRPEIPE6AFR6KHIQ",
    aws_secret_access_key:  "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",
    region:                 "sa-east-1",
  }
  config.fog_directory  = "<%= app_name %>"
  config.storage = :fog
  config.enable_processing = false if Rails.env.test? or Rails.env.cucumber?
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
