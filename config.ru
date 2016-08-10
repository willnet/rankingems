# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

# Action Cable requires that all classes are loaded in advance
Rails.application.eager_load!

use Rack::CanonicalHost, 'rankinge.ms' if ENV['RACK_ENV'] == 'production'

run Rails.application
