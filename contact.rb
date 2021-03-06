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
    ContactDatabase.insert_new_contact([@name, @email])
  end

  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      Contact.new(name,email)
    end

    def find(index)
      # TODO: Will find and return contact by index
      ContactDatabase.find(index)
    end

    def all
      # TODO: Return the list of contacts, as is
      ContactDatabase.list_contacts
    end

    def show(id)
      # TODO: Show a contact, based on ID
      ContactDatabase.show(id)
    end
  
  end

end
