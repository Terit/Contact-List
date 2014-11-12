require_relative 'contact_database'

class Contact

  attr_accessor :firstname, :lastname, :email
  attr_reader :id

  def initialize(firstname,lastname,email,id=nil)
    @id = id
    @firstname = firstname
    @lastname = lastname
    @email = email
  end

  def create
    @id = @@database.exec_params("INSERT into CONTACTS (firstname, lastname, email) values ($1, $2, $3) RETURNING id;", [@firstname, @lastname, @email]).values[0][0].to_i
  end

  def update
    @@database.exec_params("UPDATE contacts SET (firstname, lastname, email) VALUES ($1, $2, $3) WHERE id = $4;", [@firstname, @lastname, @email, @id])
  end

  def destroy
    @@database.exec("DELETE FROM contacts WHERE id = #{id};")
  end

  def save
    id ? update : create
  end

  def to_s
    "ID: #{id} Name: #{firstname} #{lastname} Email: #{email}"
  end

  class << self

    @@database = ContactDatabase.new.connection

    def all
      contacts = []
      @@database.exec("SELECT * FROM contacts") do |results|
        results.each do |contact|
          contacts << contact
        end
      end
      contacts
    end

    def find(id)
      rows = @@database.exec_params("SELECT * FROM contacts WHERE id = $1;", [id]).values
      return nil if rows.first.nil?
      Contact.new(rows[0]["firstname"],rows[0]["lastname"],rows[0]["email"])
    end

    def find_all_by_lastname(name)
      # contacts = []
      # rows = @@database.exec_params("SELECT * FROM contacts WHERE lastname = $1", [name]).values
      # rows.each do |row|
      #   contacts << Contact.new(row[1],row[2],row[3],row[0])
      # end
      # contacts
      search(name, "lastname")
    end

    def find_all_by_firstname(name)
      search(name, "firstname")
    end

    def find_by_email(email)
      search(email, "email").first
    end

    def search(keyword, column)
      contacts = []
      rows = @@database.exec_params("SELECT * FROM contacts WHERE #{column} ILIKE $1;", [keyword]).values
      rows.each do |row|
        contacts << Contact.new(row[1],row[2],row[3],row[0])
      end
      contacts
    end

  end
end
