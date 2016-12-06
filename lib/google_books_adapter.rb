class GoogleBooksAdapter
  attr_reader :query
  BASE_URL = "https://www.googleapis.com/books/v1/volumes"

  def initialize(query)
    @query = query
  end

  def fetch_books
    puts "Fetching all the books about #{query}"
    # hit the google books API and get back some book data

    response = RestClient.get("#{BASE_URL}?q=#{query}")
    data = JSON.parse(response)
    book_data = data["items"]
    # iterate over this list of book data
    book_data.each do |book|
      # for each hash of book data, create a new instance of my book class
      Book.new(book["volumeInfo"]["title"], book["volumeInfo"]["authors"], book["volumeInfo"]["description"])
    end
  end

end
