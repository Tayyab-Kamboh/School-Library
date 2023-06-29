require_relative '../person'
require_relative '../rental'

describe Person do
  describe '#add_rental' do
    let(:book) { Book.new('Title', 'Author') }
    let(:date) { Date.today }
    let(:person) { Person.new(20, 'John Doe') }

    it 'adds a new rental to the person' do
      expect {
        person.add_rental(book, date)
      }.to change { person.rentals.length }.by(1)
    end

    it 'creates a rental with correct attributes' do
      person.add_rental(book, date)
      rental = person.rentals.first

      expect(rental.date).to eq(date)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end
  end

  describe '#to_json' do
    it 'returns the person as a JSON string' do
      person = Person.new(20, 'John Doe')
      json = person.to_json
      parsed_json = JSON.parse(json)

      expect(parsed_json['id']).not_to be_nil
      expect(parsed_json['name']).to eq('John Doe')
      expect(parsed_json['age']).to eq(20)
      expect(parsed_json['parent_permission']).to eq(true)
    end
  end
end
