class Library
attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
  end

  def books
    @authors.each do |author|
      author.books.each do |book|
        @books << book
      end
    end
  end

  def publication_time_frame_for(author)
    book_timeframe = []
    author.books.each do |book|
      book_timeframe << book.publication_year
      end
      xyz = book_timeframe.map(&:to_i).sort
      {start: xyz.first.to_s, end: xyz.last.to_s}
    end
  end
