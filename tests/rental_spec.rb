require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  let(:date) { Date.today }
  let(:person) { Person.new(20, 'John Doe') }
  let(:book) { Book.new('Title', 'Author') }

  describe '#initialize' do
    it 'creates a rental with correct attributes' do
      rental = Rental.new(date, person, book)
      
      expect(rental.date).to eq(date)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end

    it 'adds the rental to the person' do
      rental = Rental.new(date, person, book)
      expect(person.rentals).to include(rental)
    end

    it 'adds the rental to the book' do
      rental = Rental.new(date, person, book)
      expect(book.rentals).to include(rental)
    end
  end

  describe '#to_json' do
    it 'returns the rental as a JSON string' do
      rental = Rental.new(date, person, book)
      json = rental.to_json
      parsed_json = JSON.parse(json)

      expect(parsed_json['date']).to eq(date.to_s)
      expect(parsed_json['person']).to eq(person)
      expect(parsed_json['book']).to eq(book)
    end
  end
end
