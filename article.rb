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

  #create new instance of class with self
  def add_article(magazine, title)
    Article.new(self, magazine, title)
  end 

  def self.all
    @@all
  end
#Returns an array of Article instances the author has written
  def articles
    Article.all.select { |article| article.author == self }
  end
#Returns a unique array of Magazine instances for which the author has contributed to
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
#Returns an array of Author instances who have written for this magazine
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

