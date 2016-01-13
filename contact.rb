require 'csv'
require_relative 'argv'

# Represents a person in an address book.
class Contact
  attr_accessor :name, :email, :id

  def initialize(name, email)
    @name = name
    @email = email
    @id = (File.open('contacts.csv', 'r').count + 1)
    contact_arr = [@id, @name, @email]
    CSV.open("contacts.csv", "a") do |new_contact|
      new_contact << contact_arr
    end
    return @id
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    # Returns an Array of Contacts loaded from the database.
    def list
      total = 0
      CSV.foreach("contacts.csv") do |line|
        print "#{line[0]}: #{line[1]}                        #{line[2]} \n"
        total += 1
      end
      puts "-----------------------------\n Total Contacts: #{total}" 
    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      CSV.foreach('contacts.csv') do |find|
        if find[0] == id
          puts "Name: #{find[1]}"
          puts "Email: #{find[2]}"
          return
        end
      end
      puts "No user with that ID."
    end

    # Returns an array of contacts who match the given term.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      CSV.foreach('contacts.csv') do |find|
        find.each do |find_in|
          if find_in.include?(term.capitalize)
            puts "Name: #{find[1]}"
            puts "Email: #{find[2]}"
            return
          end
        end
      end
      puts "Search term not found"
    end

  end

end
