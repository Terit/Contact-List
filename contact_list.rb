require_relative 'contact'
# require_relative 'contact_database'

class Application

  def initialize
    start
  end

  def   start
    input = ARGV
    menu(input)
  end

  def menu(input = "-h")

    case input.first
    when "-h", "help", nil
      puts "Here is a list of available commands:"
      puts "\t new - Create a new contact"
      puts "\t list - List all contacts"
      puts "\t show - Show a contact"
      puts "\t find - Find a contact"
      # print '> '
      # menu(STDIN.gets.chomp)

    when "new"
      # run new command
      new_contact
    when "list"
      #run list command
      list_contacts
    when "show"
      #run show command

    when "find" # use regex Here
      #run find command
    when "exit"
      return
    else
      puts "Unknown command"
      puts "Here is a list of available commands:"
      puts "\t new - Create a new contact"
      puts "\t list - List all contacts"
      puts "\t show - Show a contact"
      puts "\t find - Find a contact"
      # print '> '
      # menu(STDIN.gets.chomp)
    end
  end

  def new_contact
    puts "Contact Entry Mode"
    puts "******************************************"
    puts "Enter full name for new contact."
    print '> '
    name = STDIN.gets.chomp()
    puts "Enter email address for new contact."
    print '> '
    email = STDIN.gets.chomp()
    puts "Name: #{name}"
    puts "Email: #{email}"
    puts "Please confirm contact information is correct."
    print '> '
    if STDIN.gets.chomp() == "yes"
      Contact.create(name,email)
    else
      new_contact
    end

    # print '> '
    # menu(STDIN.gets.chomp())
    # menu
  end

  def list_contacts
    puts "Contact List"
    puts "******************************************"
    Contact.list
    # print '> '
    # menu(STDIN.gets.chomp())
  end

end

app = Application.new
