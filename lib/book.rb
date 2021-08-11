require "pry"

class Book
  attr_accessor :name, :author, :genre, :page_count

  @@count = 0
  @@total_pages = 0
  @@authors = []
  @@genres = []

  def initialize(name, author, genre, page_count)
    @name = name
    @author = author
    @genre = genre
    @page_count = page_count
    @@count += 1
    @@authors << author
    @@genres << genre
    @@total_pages += page_count
  end

  def self.count
    @@count
  end

  def self.total_pages
    @@total_pages
  end

  def self.authors
    @@authors.uniq
  end

  def self.genres
    @@genres.uniq
  end

  def self.genre_count
    genre_count = {} # genre_count => { nonfiction: 2, business: 1 }
    @@genres.each do |genre| # @@genres => ["nonfiction", "nonfiction", "business"]
      if genre_count.keys.include?(genre.to_sym)
        genre_count[genre.to_sym] += 1
      else
        genre_count[genre.to_sym] = 1
      end
    end

    genre_count
  end
end