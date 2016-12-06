class BookItCLI

  def call
    greet_user
    input = prompt_for_search_term
    while input != 'exit'
      query = parse_input(input)
      fetch_books(query)
      render_books
      input = prompt_for_search_term
    end
  end

  def greet_user
    puts 'Welcome to the BookIt App!'
  end

  def prompt_for_search_term
    print 'Please enter a search term: '
    gets.strip
  end

  def parse_input(input)
    input.downcase.gsub(' ', '+')
  end

  def fetch_books(query)
    adapter = GoogleBooksAdapter.new(query)
    adapter.fetch_books
  end

  def render_books
    books = Book.all
    books.each do |book|
      display_book(book)
    end
  end

  def display_book(book)
    puts "Title: #{book.title}"
    puts "Author Names: #{book.author_names}"
    puts "Description: #{book.description}"
    puts "---------------------------------"
  end

end
