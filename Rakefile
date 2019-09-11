require_relative 'config/environment'
require 'sinatra/activerecord/rake'
require "csv"
require "sqlite3"

desc 'run enviroment'
task :run do
  'ruby config/environment.rb'
end


desc "parse csv"
task :csv do
    CSV.foreach("tripsdata.csv", headers: true, header_converters: :symbol) do |row|
      Trip.create(
          company_id: row[0],
          location: row[1],
          river_id: row[2],
          name: row[3],
          rapid_level: row[4],
          age: row[5],
          cost: row[6]
      )
    end
end


