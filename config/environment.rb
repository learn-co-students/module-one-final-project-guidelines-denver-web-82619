require 'sinatra/activerecord'
require 'require_all'
require 'pry'
require 'tty-prompt'


require_all 'lib'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3', database: 'db/project.db')
# ActiveRecord::Base.logger = nil

PROMPT = TTY::Prompt.new
Cli.start
User.get_user
cli = User.sign_in

cli.user_main_menu

#user_main_menu
#binding.pry