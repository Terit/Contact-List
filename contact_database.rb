## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase
  @contact_db = "contacts.csv"

  def self.list_contacts
    # File.open(@contact_db,"r") do |file|
    #   puts file.readline.inspect
    # end
    # CSV.foreach(@contact_db) do |row|
    #   puts "Name: #{row[0]} Email: #{row[1]}"
    # end

    contacts_array = CSV.read(@contact_db)
    contacts_array.each_with_index do |contact, row|
      puts "Name: #{contact[0]} Email: #{contact[1]} ID #{row + 1}"
    end
  end

  def self.insert_new_contact(contact)
    CSV.open(@contact_db, "a") do |csv|
      csv.add_row(contact)
    end
    contacts_array = CSV.read(@contact_db)
    puts "an index #{contacts_array.index(contacts_array[-1]) + 1}"
  end

  def self.find(search_term)
    #####
    contacts_array = CSV.read(@contact_db)
    output = contacts_array.select do |contact|
      contact.include?(search_term)
    end
    puts output
  end

  def self.show(id)
    contacts_array = CSV.read(@contact_db)
    output = contacts_array.detect do |contact|
      (contacts_array.index(contact) + 1) == id.to_i
    end
    puts output
  end
end
