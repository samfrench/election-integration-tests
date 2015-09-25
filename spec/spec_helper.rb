$: << File.join(File.dirname(__FILE__),"..", "lib")

require "pry"
require "site_prism"
require "capybara"
require "capybara/poltergeist"

ENV["APP_ENV"] = "test"

RSpec.configure do |config|
  config.order = "random"
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :poltergeist
  config.app_host = "http://www.bbc.co.uk"
end
