require_relative "../models/address_book"
class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end
  
  def main_menu
    puts "Main menu - #{address_book.entries.count} entries "
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from CSV"
    puts "5 - Exit"
    puts "Enter your selection: "

    selection = gets.to_i
    puts "You picked - #{selection}"

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
      search_entry
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5 
      puts "Good-bye"
      # exiting from the program without giving error
      exit(0) 
    else
      system "clear"
      puts "Sorry that is an invalid input"
      main_menu
    end          
  end 


  def view_all_entries

  end
  
  def create_entry
    system "clear"
    puts "New Addressbloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone Number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp
    @address_book.add_entry(name, phone, email)
    system "clear"
    puts "New entry created"
  end

  def search_entry
  end

  def read_csv
  end



end  

