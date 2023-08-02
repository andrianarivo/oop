require 'rspec'
require_relative '../book'

RSpec.describe Book do
  describe '#initialize' do
    it 'creates a new Book object with title and author' do
      book = Book.new('Title', 'Author')
      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
    end
  end
end
