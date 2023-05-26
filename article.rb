require_relative 'magazine'
require_relative 'author'

class Article
  attr_reader :author, :magazine, :title
  @@all = []

  def initialize(author, magazine, title)
    @author = author
    @magazine = magazine
    @title = title
    @@all << self
  end

  def self.all
    @@all
  end 
end

magazine = Magazine.new("This is Ruby", "Programming")
author = Author.new("Sophie")
article = Article.new(author, magazine, "Programming Language")

p article
puts  Article.all
