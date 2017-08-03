require "bundler/setup"
require "book_deals"
require_relative "./book_deals/cli_spec"
require_relative "../lib/book_deals/cli"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
