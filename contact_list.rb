require_relative 'contact'
# require_relative 'contact_database'

class Application

  def initialize
    input = ARGV
    menu(input)
  end

  def menu(input = ["-h"])

    case input.first
    when "-h", "help", nil
      puts "Here is a list of available commands:"
      puts "\t new - Create a new contact"
      puts "\t list - List all contacts"
      puts "\t show - Show a contact"
      puts "\t find - Find a contact"
    when "new"
      new_contact
    when "list"
      list_contacts
    when "show"
      show(input[1])
    when "find"
      find(input[1])
    when "add"
      add_phone_number if input[1] == "phone"
    when "exit"
      return
    else
      puts "contact_list.rb: invalid option -- #{input[0]}"
      puts "Try 'contact_list.rb -h' for more information."
    end
  end

  def new_contact
    puts "Contact Entry Mode"
    puts "******************************************"
    print "Enter email address for new contact: "
    email_check = false
    until email_check == true
      email = STDIN.gets.chomp()
      if email == 'quit' || email == ''
        email_check = true # CHECK OUT THIS LINE ANDY!!!!!
      elsif Contact.exists?(email)
        puts "Contact already exists. Enter another email address or quit."
      else
        email_check = true
        print "Enter full name for new contact: "
        name = STDIN.gets.chomp()
        puts "Name: #{name}"
        puts "Email: #{email}"
        print "Please confirm contact information is correct: "
        if STDIN.gets.chomp() == "yes"
          puts "New Contact ID: #{Contact.create(name,email)}"
        else
          new_contact
        end
      end
    end
  end

  def list_contacts
    puts "Contact List"
    puts "******************************************"
    contacts_array = Contact.all
    contacts_array.each_with_index do |contact, row|
      phone_numbers = String.new
      if contact[2]
        contact[2].each do |type, number|
          phone_numbers << "#{type.to_s.capitalize}: #{number} "
        end
      end
      puts "ID: #{row + 1} Name: #{contact[0]} Email: #{contact[1]} #{phone_numbers}"
    end
  end

  def find(keyword)
    results = Contact.find(keyword)
    puts "Found #{results.length} results: "
    results.each do |result|
      phone_numbers = String.new
      if result[2]
        result[2].each do |type, number|
          phone_numbers << "#{type.to_s.capitalize}: #{number} "
        end
      end
      puts "Name: #{result[0]} Email: #{result[1]} #{phone_numbers}"
    end
  end

  def show(id)
    result = Contact.show(id)
    # puts "Name: #{results[0]} Email: #{results[1]}"
    phone_numbers = String.new
    if result[2]
      result[2].each do |type, number|
        phone_numbers << "#{type.to_s.capitalize}: #{number} "
      end
    end
    puts "Name: #{result[0]} Email: #{result[1]} #{phone_numbers}"
  end

  def add_phone_number
    input = Array.new
    print "Please enter the contact email: "
    contact_email = STDIN.gets.chomp
    if Contact.exists?(contact_email)
      loop do
        print "Please enter a phone number(or q to quit): "
        number = STDIN.gets.chomp
        break if number == 'q'
        print "Please enter the phone number type: "
        type = STDIN.gets.chomp
        input = [type.to_sym, number]
      end
      Contact.add_phone_number(contact_email, input)
    else
      puts "No contact found for that email."
    end
  end
end

app = Application.new
