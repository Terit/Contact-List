require_relative 'contact_database'

class Contact

  attr_accessor :name, :email

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
    ContactDatabase.write([@name, @email])
  end

  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      Contact.new(name,email)
      ContactDatabase.read.length
    end

    def find(index)
      # TODO: Will find and return contact by index
      contacts_array = ContactDatabase.read
      results = contacts_array.select do |contact|
        contact.detect do |information|
          information.downcase.include? (index.downcase.to_s)
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
      output = contacts_array.detect do |contact|
        (contacts_array.index(contact) + 1) == id.to_i
      end
    end

    def exists?(email)
      contacts_array = ContactDatabase.read
      contacts_array.each do |contact|
        return true if contact[1] == email
      end
      false
    end

  end

end
