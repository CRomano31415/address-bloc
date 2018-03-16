#needs to connect to Address book, display main menu and process user input

require_relative '../models/address_book' #connects to AddressBook

class MenuController
  attr_reader :address_book #allows read only access to address book

  def initialize
    @address_book = AddressBook.new #instance variable address book of new AddressBook
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries" #prints out entry and title
    #prints out rest of menu
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "

    selection  = gets.to_i #gets user input and changes string to integer

    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      puts "Good-bye!"
      exit(0) #program exit without an error
    else #catches invalid user input like letters or other chars
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end

  def view_all_entries
    address_book.entries.each do |entry| #loops through all entries
      system "clear"
      puts entry.to_s #converts entries to string and prints them
      entry_submenu(entry) #menu not created yet to display a menu
    end
    system "clear"
    puts "End of entries"
  end

def entry_submenu(entry)
  puts "n - next entry"
  puts "d - delete entry"
  puts "e - edit this entry"
  puts "m - return to main menu"

  selection = gets.chomp

    case selection
    when "n"

    when "d"
    when "e"
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entry_submenu(entry)
    end
  end 

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name: "
    name = gets.chomp #this will wait for user input before the next puts and will store input in name removing added spaces
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    address_book.add_entry(name, phone, email) #will call add_entry method from address_book.rb and add the entry

    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end
end
