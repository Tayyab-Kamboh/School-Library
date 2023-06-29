require_relative '../book'
require_relative '../person'
require_relative '../rental'
require 'date'

RSpec.describe Book do
  let(:person) { Person.new(20, 'John Doe') }
  let(:date) { Date.today }
  let(:book) { Book.new('Title', 'Author') }

  describe '#add_rental' do
    it 'adds a new rental to the book' do
      expect do
        book.add_rental(person, date)
      end.to change { book.rentals.length }.by(1)
    end

    it 'creates a rental with correct attributes' do
      book.add_rental(person, date)
      rental = book.rentals.first

      expect(rental.date).to eq(date)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end
  end

  describe '#to_json' do
    it 'returns the book as a JSON string' do
      json = book.to_json
      parsed_json = JSON.parse(json)

      expect(parsed_json['title']).to eq('Title')
      expect(parsed_json['author']).to eq('Author')
    end
  end

  describe 'can_use_services' do
    it 'returns true' do
      expect(book.can_use_services?).to eq(true)
    end
  end
end
