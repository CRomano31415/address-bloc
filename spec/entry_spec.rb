require_relative '../models/entry'  #loads entry model for testing

RSpec.describe Entry do #standard first line, its a spec testing Entry
  describe "attributes" do #specs test the Entry attributes
    let(:entry) { Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')}
    it "responds to name" do #individual test 1
      expect(entry).to respond_to(:name) #expectations to pass
    end
    it "reports its name" do #individual test 1
      expect(entry.name).to eq('Ada Lovelace') #expectations to pass
    end

    it "responds to phone number" do #individual test 2
      expect(entry).to respond_to(:phone_number) #expectations to pass test 2
    end

    it "reports its phone number" do #individual test 2
      expect(entry.phone_number).to eq('010.012.1815') #expectations to pass test 2
    end

    it "responds to email" do #individual test 3
      expect(entry).to respond_to(:email) #expectations to pass test 3
    end

    it "reports its email" do #individual test 3
      expect(entry.email).to eq('augusta.king@lovelace.com') #expectations to pass test 3
    end
end
    describe "#to_s" do
      it "prints an entry as a string" do
        entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
        expect(entry.to_s).to eq(expected_string)
      end
    end
end
