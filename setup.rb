require 'pry' # incase you want to use binding.pry
require 'active_record'
require_relative 'lib/contact'

# Output messages from AR to STDOUT
# ActiveRecord::Base.logger = Logger.new(STDOUT)

### SILVER HEROKU DB ###
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'd5ndd73rhldjkn',
  username: 'pknyishfbqnnmk',
  password: 'PBFo2REKUL_rfgZRRdQhQ6L02C',
  host: 'ec2-54-235-250-41.compute-1.amazonaws.com',
  port: 5432,
  min_messages: 'error'
)
