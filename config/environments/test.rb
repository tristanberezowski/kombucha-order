Rails.application.configure do
  config.cache_classes = true
  config.eager_load = false
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
  }
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection = false
  config.active_storage.service = :test
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :test
  config.active_support.deprecation = :stderr
  config.action_view.raise_on_missing_translations = true
  config.assets.raise_runtime_errors = true
  config.action_mailer.default_url_options = { host: "www.example.com" }
  config.action_mailer.asset_host = "http://www.example.com"
  config.active_job.queue_adapter = :inline

  config.action_mailer.delivery_method = :mailgun
  config.action_mailer.mailgun_settings = {
    api_key: 'f877bd7a-7e120914',
    domain: 'hoochyorder.com',
  }

  #for svgs:
  config.assets.precompile += %w( '.svg' )  

  # Must include to get inline SVGs to work in deploy
  config.assets.css_compressor = :sass
end
