require_relative 'contact'
require_relative 'contact_database'

def start

  input = ARGV.first

  case input.downcase
  when "-h", "help", nil
    puts "Here is a list of available commands:"
    puts "\t new - Create a new contact"
    puts "\t list - List all contacts"
    puts "\t show - Show a contact"
    puts "\t find - Find a contact"
  when "new"
    # run new command
  when "list"
    puts "list test"
    #run list command
  when "show"
    #run show command
  when "find" # use regex Here
    #run find command
  else
    puts "Unknown command"
    puts "Here is a list of available commands:"
    puts "\t new - Create a new contact"
    puts "\t list - List all contacts"
    puts "\t show - Show a contact"
    puts "\t find - Find a contact"
  end

end

start