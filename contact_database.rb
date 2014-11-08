## TODO: Implement CSV reading/writing
require 'pry'
require 'csv'

class ContactDatabase

  class << self
    def db
      @database ||= read
    end

    def read_phone_numbers(numbers_string)
      phone_numbers = Hash.new
      numbers_array = numbers_string.split(" ") 
      num_phone_numbers = numbers_array.length / 2
      counter = 0

      until counter > num_phone_numbers
        key = numbers_array[counter].to_sym
        value = numbers_array[counter + 1]
        phone_numbers[key] = value
        counter += 2
      end
      phone_numbers
    end

    def phone_numbers_to_s(contact)
      string = String.new
      contact[2].each { |type, number| string << "#{type.to_s} #{number} " }
      contact[2] = string
    end

    def read
      database = Array.new
      File.foreach('contacts.csv') do |csv_line|
        row = CSV.parse(csv_line).first
        contact = [row[0],row[1]]   
        if row.length > 2
          phone_numbers = read_phone_numbers(row[2])
          contact << phone_numbers
        end
        database << contact
        end
        database
    end

    def add(*contact)
      db << contact
    end

    def update(contacts)
      @database = contacts
    end

    def write
      CSV.open("contacts.csv", "w+") do |csv|
        db.each do |db_contact| 
          if db_contact[2]
            phone_numbers_to_s(db_contact)
          end
          csv.add_row(db_contact)
        end
      end
    end
  end
end
