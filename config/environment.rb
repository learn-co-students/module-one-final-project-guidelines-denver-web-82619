# frozen_string_literal: true

require 'bundler'
require 'sinatra/activerecord'
require 'require_all'
require 'pry'
require 'poke-api-v2'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/pokemon.db'
)
require_all 'lib'
