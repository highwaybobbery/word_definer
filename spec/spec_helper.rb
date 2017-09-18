ENV['RACK_ENV'] = 'test'
require 'rspec'
require 'pry'
require 'db_connection'

db_connection = DbConnection.connection

RSpec.configure do |config|
  config.before(:suite) do
    db_connection.reset_db
  end

  config.before(:each) do
    db_connection.clear_tables
  end
end
