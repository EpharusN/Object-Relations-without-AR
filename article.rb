#initialize article with author, magazine and title
#returns name of author, magazine and title
#used attr_reader sice author, magazine and title should not change

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

class Author
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def articles
    Article.all.select { |article| article.author == self }
  end

  def magazines
    articles.map { |article| article.magazine }
  end
end

class Magazine
  attr_reader :name, :category
  @@all = []

  def initialize(name, category)
    @name = name
    @category = category
    @@all << self
  end

  def self.all
    @@all
  end

  def contributors
    Article.all.select { |article| article.magazine == self }.map { |article| article.author }
  end
end

magazine = Magazine.new("This is Ruby", "Programming")
author = Author.new("Sophie")
article = Article.new(author, magazine, "Programming Language")

p article.author
p article.magazine
p author.articles
p author.magazines
p magazine.contributors

