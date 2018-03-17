require_relative 'entry'
require "csv"

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end
    entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name, phone_number, email)
    index = 0
    entries.each_with_index do |entry, index|
      if name == entry.name && phone_number == entry.phone_number && email == entry.email
        break
      end
    end
    entries.delete_at(index)
  end

  def import_from_csv(file_name) #this method will import from a csv file and add entries
    csv_text = File.read(file_name) #this will read the text and store it in variable
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true) #class CSV will parse

    csv.each do |row|  #iterate over rows
    row_hash = row.to_hash #create a hash for each row
    add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"]) #call add entry method with each hash key/value as the arguments
    end
  end

  def binary_search(name)
    #define two variables that will define our range
    lower = 0
    upper = entries.length - 1

    while lower <= upper #basically not nil, has to have length of 1 at least
      mid = (lower + upper)/2 #hold the median -- ruby will truncate decimals
      mid_name = entries[mid].name #hold the median name entry

      #this whole if statement basically grabs the entry and keeps count on how far it is from the middle, until it gets to the middle
      if name == mid_name #if the loop is on the median, == case sensitive
        return entries[mid] #return it, we found it!
      elsif name < mid_name #if the name comes in before the median
        upper = mid - 1 #we change the value of upper so we eliminate the entire upper group
      elsif name > mid_name #if name comes in after the median
        lower = mid + 1 #we change the value of lower to we eliminate the entire lower group
      end
    end
    return nil
  end

  def iterative_search(name)
    #this one is just going to loop one by one
    entries.each do |entry|
      if entry.name == name
        return entry #return it, we found it!
      end
    end
    return nil
  end

end
