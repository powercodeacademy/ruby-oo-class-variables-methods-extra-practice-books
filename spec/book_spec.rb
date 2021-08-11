require "spec_helper"

describe Book do
  describe 'instance methods' do
    let!(:scrum) { Book.new('Scrum', 'J. J. Sutherland', 'business', 178) }

    describe '#initialize' do
      it 'takes in four arguments: a name, author, genre, and page_count' do
        expect { Book.new('Scrum', 'J. J. Sutherland', 'business', 178) }.not_to raise_error
      end
    end

    describe '#name' do
      it 'returns the name' do
        expect(scrum.name).to eq('Scrum')
      end
    end

    describe '#author' do
      it 'returns the author' do
        expect(scrum.author).to eq('J. J. Sutherland')
      end
    end

    describe '#genre' do
      it 'returns the genre' do
        expect(scrum.genre).to eq('business')
      end
    end

    describe '#page_count' do
      it 'returns the page count' do
        expect(scrum.page_count).to eq(178)
      end
    end
  end

  describe 'class methods' do

    # This `before` block runs before each test so we can start with a clean slate
    before do
      # reset the class variables
      Book.class_variable_set(:@@authors, [])
      Book.class_variable_set(:@@genres, [])
      Book.class_variable_set(:@@count, 0)
      Book.class_variable_set(:@@total_pages, 0)
      Book.class_variable_set(:@@author_count, {})
      Book.class_variable_set(:@@genre_count, {})

      # create new instances using the Book class
      Book.new("Talking to Strangers", "Malcolm Gladwell", "nonfiction", 149)
      Book.new("blink", "Malcolm Gladwell", "nonfiction", 203)
      Book.new("Scrum", "J. J. Sutherland", "business", 178)
    end

    describe 'class variables' do
      it 'has a class variable, @@count' do
        expect(Book.class_variable_get(:@@count)).to eq(3)
      end

      it "has a class variable, @@authors, that contains all of the authors of existing books" do
        expect(Book.class_variable_get(:@@authors)).to match(["Malcolm Gladwell", "Malcolm Gladwell", "J. J. Sutherland"])
      end

      it "has a class variable, @@genres, that contains all of the genres of existing books" do
        expect(Book.class_variable_get(:@@genres)).to match(["nonfiction", "nonfiction", "business"])
      end
      it "has a class variable, @@total_pages, that has a running count of the total pages of all books" do
        expect(Book.class_variable_get(:@@total_pages)).to match(530)
      end
    end

    describe ".count" do
      it "is a class method that returns that number of books created" do
        expect(Book.count).to eq(3)
      end
    end

    describe ".total_pages" do
      it "is a class method that returns that number of total pages in the library" do
        expect(Book.total_pages).to eq(530)
      end
    end

    describe ".authors" do
      it "is a class method that returns a unique array of authors of existing books" do
        expect(Book.authors).to match(["Malcolm Gladwell", "J. J. Sutherland"])
      end
    end

    describe ".genres" do
      it "is a class method that returns a unique array of genres of existing books" do
        expect(Book.genres).to match(["nonfiction", "business"])
      end
    end

    describe ".genre_count" do
      it "is a class method that returns a hash of genres and the number of books that have those genres" do
        expect(Book.genre_count).to eq({ nonfiction: 2, business: 1 })
      end
    end
  end

end
