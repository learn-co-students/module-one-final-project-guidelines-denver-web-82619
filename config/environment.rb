require 'bundler'
require 'csv'
require 'require_all'
require_all 'lib'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
