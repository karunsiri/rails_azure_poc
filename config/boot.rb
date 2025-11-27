ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
require "dotenv"

boolean_coercion_lib = %w[
  false_class
  nil_class
  string
  true_class
]

boolean_coercion_lib.each do |lib|
  require File.expand_path("../lib/#{lib}", __dir__)
end

# Load default environment variables from .env, .env.<environment> file.
# Doc: https://github.com/bkeepers/dotenv
Dotenv.load

# Load environment variables from environment file if provided.
variable_file = ENV.fetch("ENV_FILE", "")
unless variable_file.empty?
  Dotenv.load(variable_file)
end
