## TODO: Implement CSV reading/writing
# require 'pry'
require 'csv'

class ContactDatabase
  class << self
    def read
      CSV.read("contacts.csv")
    end

    def write(contact)
      CSV.open("contacts.csv", "a") do |csv|
        csv.add_row(contact)
      end
    end
  end
end
