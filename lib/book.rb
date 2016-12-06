class Book
  attr_accessor :title, :authors, :description
  ALL = []

  def self.all
    ALL
  end

  def initialize(title, authors, description)
    @title       = title
    @authors     = authors
    @description = description
    ALL << self
  end

  def author_names
    if authors
      authors.join(" and ")
    else
      'No Author Info Found'
    end
  end

end
