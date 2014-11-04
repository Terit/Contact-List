## TODO: Implement CSV reading/writing
# require 'pry'
require 'csv'

class ContactDatabase
  # @contact_db = "contacts.csv"
  @contacts_array = CSV.read("contacts.csv")

  def self.list_contacts
    # File.open(@contact_db,"r") do |file|
    #   puts file.readline.inspect
    # end
    # CSV.foreach(@contact_db) do |row|
    #   puts "Name: #{row[0]} Email: #{row[1]}"
    # end

    # @contacts_array = CSV.read(@contact_db)
    @contacts_array.each_with_index do |contact, row|
      puts "Name: #{contact[0]} Email: #{contact[1]} ID #{row + 1}"
    end
  end

  def self.insert_new_contact(contact)
    CSV.open("contacts.csv", "a") do |csv|
      csv.add_row(contact)
    end
    # @contacts_array = CSV.read(@contact_db)
    puts "New contact ID #{@contacts_array.index(@contacts_array[-1]) + 1}"
  end

  def self.find(search_term)

    # only finding 1 word results
    # ie not finding Andy in "Andy Theriault"
    # @contacts_array = CSV.read(@contact_db)

    results = @contacts_array.select do |contact|
      contact.each do |information|
        information.include? (search_term.to_s)
      end
    end
    puts "Found #{results.length} results: "
    results.each do |result|
      puts "Name: #{result[0]} Email: #{result[1]}"
    end
  end

  def self.show(id)
    # @contacts_array = CSV.read(@contact_db)
    output = @contacts_array.detect do |contact|
      (@contacts_array.index(contact) + 1) == id.to_i
    end
    puts output
  end
end
