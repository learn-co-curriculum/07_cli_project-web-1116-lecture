class BookIt
  attr_reader :query

  def call
    # greet the user
    greet_user
    run
  end

  def run
    input = get_input
    while input != 'exit'
      fetch_books(input)
      books = Book.all
      render(books)
      input = get_input
    end
  end

  def greet_user
    puts "Welcome to Book-It!"
  end

  def get_input
    print "Please enter a search term or 'exit' to quit: "
    input = gets.strip
  end

  def render(books)
    books.each do |book|
      puts "Title: #{book.title}"
      puts "Authors: #{book.author_names}"
      puts "Description: #{book.description}"
      puts "---------------------"
    end
  end

  def fetch_books(term)
    GoogleBooksAdapter.new.fetch(term)
  end

end
