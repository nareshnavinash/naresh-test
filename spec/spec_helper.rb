require 'selenium-webdriver'
require 'rspec/core'
require 'require_all'
require 'headless'
require "pry"
require 'yaml'
require 'allure-rspec'
Dir["../locators/*.rb"].each {|file| require file }
Dir["../libraries/*.rb"].each {|file| require file }
Dir["../pages/*.rb"].each {|file| require file }
Dir["../test-data/"].each {|file| require file }


RSpec.configure do |config|
    config.filter_run_when_matching :focus
    config.example_status_persistence_file_path = "reports/examples.txt"
    config.include AllureRSpec::Adaptor
end

AllureRSpec.configure do |config|
    config.output_dir = "reports/allure"
    config.clean_dir = true
    config.logging_level = Logger::WARN
end