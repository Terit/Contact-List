require_relative 'contact'

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
      show(input[1].to_i)
    when "find"
      find(input[1])
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
    email = STDIN.gets.chomp()
    return nil if email == 'quit' || email == ''
    if Contact.find_by_email(email)
      puts "Contact already exists. Enter another email address."
    else
      print "Enter first name for new contact: "
      firstname = STDIN.gets.chomp()
      print "Enter last name for new contact: "
      lastname = STDIN.gets.chomp()
      puts "Name: #{firstname} #{lastname}"
      puts "Email: #{email}"
      print "Please confirm contact information is correct: "
      if STDIN.gets.chomp() == "yes"
        puts "New Contact ID: #{Contact.new(firstname,lastname, email).save.id}"
      else
        new_contact
      end
    end
  end

  def list_contacts
    puts "Contact List"
    puts "******************************************"
    contacts_array = Contact.all
    contacts_array.each do |contact|
      puts contact
    end
  end

  def find(keyword)
    results = []
    results << Contact.find_by_email(keyword)
    results << Contact.find_all_by_lastname(keyword)
    results << Contact.find_all_by_firstname(keyword)
    puts results.flatten
  end

  def show(id)
    puts Contact.find(id)
  end
end

app = Application.new
