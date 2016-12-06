class GoogleBooksAdapter
  attr_reader :query

  BASE_URL = "https://www.googleapis.com/books/v1/volumes"

  def fetch(input)
    parse_query(input)
    populate_books
  end

  private

  def parse_query(input)
    @query = input.gsub(' ', '+')
  end

  def populate_books
    book_data.each do |book_data|
      Book.new({
        title: book_data["volumeInfo"]["title"],
        authors: book_data["volumeInfo"]["authors"],
        description: book_data["volumeInfo"]["description"]
        })
    end
  end

  def book_data
    response = RestClient.get("#{BASE_URL}?q=#{query}")
    JSON.parse(response)["items"]
  end


end
