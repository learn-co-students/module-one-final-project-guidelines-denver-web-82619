require 'sinatra/activerecord'
require 'require_all'
require 'pry'
require 'tty-prompt'


require_all 'lib'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3', database: 'db/project.db')

PROMPT = TTY::Prompt.new

person = Cli.start
