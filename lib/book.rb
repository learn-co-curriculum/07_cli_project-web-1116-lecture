class Book
  attr_accessor :title, :authors, :description
  ALL = []

  def self.all
    ALL
  end

  def initialize(opts)
    opts.each do |attribute, value|
      send("#{attribute.to_s}=", value)
    end
    ALL << self
  end

  def author_names
    authors.join(" and ")
  end

end
