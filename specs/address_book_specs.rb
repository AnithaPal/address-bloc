RSpec.describe AddressBook do
  let(:book) {AddressBook.new} #This is  asubtitute for book = AddressBook.new

  #helper method to reduce code redundancy. To test csv entries we have 5 different set of entries.Instead of writing 5 times. 
  #create a method and use it 5 times.
  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eql expected_name
    expect(entry.phone_number).eo eql expected_number
    expect(entry.email).to eql expected_email
  end 


  context "attributes" do
    it "should respond to entries" do
      #book = AddressBook.new
      expect(book).to respond_to(:entries)
    end 

    it "should initialize entries as an array" do
      #book = AddressBook.new
      expect(book.entries).to be_a(Array)
    end
    it "should initialize entries as an empty array" do
       #book = AddressBook.new
       expect(book.entries.size).eql? 0
    end   
  end 

  #context for add_entry method
  context ".add_entry" do
    it "adds only one entry to the address book" do 
       #book = AddressBook.new     
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       
       expect(book.entries.size).eql? 1
     end
    
    
    it "add correct information to the entries" do
      #book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]
      expect(new_entry.name).eql? 'Ada Lovelace'
      expect(new_entry.phone_number).eql? '010.012.1815'
      expect(new_entry.email).eql? 'augusta.king@lovelace.com'
    end  

  end



  #context to import fromcsv file
  #Test that AddressBook's .import_from_csv() method is working as expected
  context ".import_from_csv" do
    it "imports teh correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size
      # Check the size of the entries in AddressBook
      expect(book_size).to eql 5
    end  

    it "it checks details of the first entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Bill", "555-555-5555", "bill@blocmail.com")
      #expect(entry_one.name).to eql "Bill"
      #expect(entry_one.phone_number).to eql "555-555-5555"
      #expect(entry_one.email).to eql "bill@blocmail.com"

    end

    it "checks the details of the second entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two,"Bob", "555-555-5555", "bob@blocmail.com")
       #expect(entry_two.name).to eql "Bob"
       #expect(entry_two.phone_number).to eql "555-555-5555"
       #expect(entry_two.email).to eql "bob@blocmail.com"
     end
 
     it "checks the details of the third entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
       check_entry(entry_three, "Joe", "555-555-5555", "joe@blocmail.com")
       #expect(entry_three.name).to eql "Joe"
       #expect(entry_three.phone_number).to eql "555-555-5555"
       #expect(entry_three.email).to eql "joe@blocmail.com"
     end
 
     it "checks the details of the fourth entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
       check_entry(entry_four, "Sally", "555-555-5555", "sally@blocmail.com")
       #expect(entry_four.name).to eql  "Sally"
       #expect(entry_four.phone_number).to eql "555-555-5555"
       #expect(entry_four.email).to eql "sally@blocmail.com"
     end
 
     it "checks the details of the fifth entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
       check_entry(entry_five, "Sussie", "555-555-5555", "sussie@blocmail.com")
       #expect(entry_five.name).to eql "Sussie"
       #expect(entry_five.phone_number).to eql "555-555-5555"
       #expect(entry.email).to eql "sussie@blocmail.com"
     end
  end  

  #context for remove_entry method

  context ".remove_entry" do
    it "it removes only one entry from the address book" do
    #book = AddressBook.new
    book.remove_entry('Ada Lovelace')
    expect(book.entries.size).eql? 0
    end

    xit "remove correct information from the entries" do
      #book = AddressBook.new
      expect(book.name).not_to eql? (book.name)
      expect(book.phone_number).not_to eql? (book.phone_number)
      expect(book.email).not_to eql? (book.email)
    end  


  end
end  
