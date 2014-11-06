## TODO: Implement CSV reading/writing
# require 'pry'
require 'csv'

class ContactDatabase

  class << self   
    def db
      @database ||= read
    end

    def read
      db = CSV.read("contacts.csv")
    end

    # def add(name, email)
    #   db << [name, email]
    # end

    def add(*contact)
      db << contact
    end

    def update(contacts)
      @database = contacts
    end

    def write
      CSV.open("contacts.csv", "w+") do |csv|
        db.each { |db_contact| csv.add_row(db_contact) }
      end
    end
  end
end
