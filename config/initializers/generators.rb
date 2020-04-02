Rails.application.config.generators do |g|
  g.assets false
  g.helper false
  g.test_framework :rspec,
    view_specs: false,
    helper_specs: false,
    routing_specs: false,
    controller_specs: false,
    request_specs: false
end 