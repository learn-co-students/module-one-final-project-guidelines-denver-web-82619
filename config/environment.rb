require 'sinatra/activerecord'
require 'require_all'
require 'pry'
require 'tty-prompt'
require 'tty-box'

require_all 'lib'


ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/development.db'
)

ActiveRecord::Base.logger = nil

# binding.pry
0