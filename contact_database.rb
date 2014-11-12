require 'pg'

class ContactDatabase

  attr_reader :connection

  def initialize
    establish_connection
  end

  def establish_connection
    @connection = PG.connect(
      dbname: 'd5ndd73rhldjkn',
      port: 5432,
      user: 'pknyishfbqnnmk',
      host: 'ec2-54-235-250-41.compute-1.amazonaws.com',
      password: 'PBFo2REKUL_rfgZRRdQhQ6L02C'
    )
  end

  def close
    @connection.close
  end
end
