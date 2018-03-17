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

  def import_from_csv(file_name)
    csv_text = File.read(file_name) #this will read the text and store it in variable
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true) #class CSV will parse

    csv.each do |row|  #iterate over rows
      row_hash = row.to_hash #create a hash for each row
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"]) #call add entry method with each hash key/value as the arguments
    end
  end

end
