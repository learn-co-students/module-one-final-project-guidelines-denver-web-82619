require 'sinatra/activerecord'
require 'require_all'
require_all 'lib'

# require 'bundler'
# Bundler.require

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/bookuser.db'
)

