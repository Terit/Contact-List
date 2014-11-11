require 'pry'
require_relative 'contact_database'

class Contact

  attr_accessor :name, :email, :phone_numbers

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    save
  end

  def to_s
    # TODO: return string representation of Contact
  end

  def save
    ContactDatabase.add(@name, @email)
  end

  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      Contact.new(name,email)
      ContactDatabase.write
      ContactDatabase.db.length
    end

    def find(keyword)
      # TODO: Will find and return contact by keyword
      contacts_array = ContactDatabase.read
      results = contacts_array.select do |contact|
        contact.detect do |information|
          information.downcase.include? (keyword.downcase.to_s)
        end
      end
    end

    def all
      # TODO: Return the list of contacts, as is
      ContactDatabase.read
    end

    def show(id)
      # TODO: Show a contact, based on ID
      contacts_array = ContactDatabase.read
      contacts_array.each_with_index do |value, index|
        # binding.pry
        return value if (index + 1) == id.to_i
      end
      return []
    end

    def exists?(email)
      contacts_array = ContactDatabase.read
      contacts_array.each do |contact|
        return true if contact[1] == email
      end
      false
    end

    def add_phone_number(contact_email, phone_array)
      # TODO: append phone_hash to the contact csv line
      contacts_array = ContactDatabase.read
      contacts_array.each do |contact|
        if contact[1].include? contact_email
          if contact[2]
            contact[2][phone_array[0]] = phone_array[1]
          else
            contact << Hash[*phone_array]
          end
        end
      end
      ContactDatabase.update(contacts_array)
      ContactDatabase.write
    end

  end

end
