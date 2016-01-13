require_relative 'contact'
case ARGV[0]
when "list"
  Contact.list
when "new"
  print "Enter full name of contact: "
  name = STDIN.gets.chomp.split.map(&:capitalize).join(' ')
  print "Enter email of contact: "
  email = STDIN.gets.chomp
  Contact.new(name, email)
when "show"
  print "ID: "
  id = STDIN.gets.chomp
  Contact.find(id)
when nil
  puts "Here is a list of available commands:
  new - Create a new contact
  list - List all contacts
  show - Show a contact
  search - Search contacts"
end

if ARGV[0] == "search" && !ARGV[1].nil?
  Contact.search(ARGV[1])
end