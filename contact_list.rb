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
    puts "Enter email address for new contact."
    email_check = false
    until email_check
      print '> '
      email = STDIN.gets.chomp()
      if email == 'quit' || ''
        break
      elsif Contact.exists?(email)
        puts "Contact already exists. Enter another email address or quit."
        # break if STDIN.gets.chomp() == "quit" || nil
      else
        email_check = true
        puts "Enter full name for new contact."
        print '> '
        name = STDIN.gets.chomp()
        puts "Name: #{name}"
        puts "Email: #{email}"
        puts "Please confirm contact information is correct."
        print '> '
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
      puts "ID: #{row + 1} Name: #{contact[0]} Email: #{contact[1]}"
    end
  end

  def find(id)
    results = Contact.find(id)
    puts "Found #{results.length} results: "
    results.each do |result|
      puts "Name: #{result[0]} Email: #{result[1]}"
    end
  end
  def show(search)
    results = Contact.show(search)
    puts "Name: #{results[0]} Email: #{results[1]}"
  end
end

app = Application.new
