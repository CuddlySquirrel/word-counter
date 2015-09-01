require "capybara/rails"
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {
    :timeout => 90,
    :debug => false,
    :js_errors => true,
    :phantomjs_options => ['--web-security=true']
  })
end

Capybara.configure do |config|
	config.default_selector = :css
  config.default_wait_time = 15000
  config.match = :prefer_exact
  config.ignore_hidden_elements = false
	config.javascript_driver = :poltergeist
	config.app_host = 'http://localhost'
	config.server_port = 7787
end




