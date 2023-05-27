#initialize article instance with author, magazine and title
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

  #create new article 
  def add_article(magazine, title)
    Article.new(self, magazine, title)# you can use self in author it will work the same way
  end 

  #syntax for returning unique array of string in ruby
  #array.map{|x/element|what you want to modify or transform/magazine x.to_}.uniq
  #magazines.map{|magazine|magazine.category.to_upcase}.uniq
  def topic_areas 
    magazines.map{|magazine| magazine.category}.uniq #to return a uniq array
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
#find syntax collection/article/magazine/author.find {|element/magazine/article|condition?/true/even}
def self.find_by_name(name)
    @@all.find{|magazine|magazine.name == name}

end


def article_titles
    Article.all.select {|article|article.magazine == author}.map {|article|article.title}
end
#Returns an array of Author instances who have written for this magazine
  def contributors
    Article.all.select { |article| article.magazine == self }.map { |article| article.author }
  end

  def contributing_authors
    authors_count = Hash.new(0)

    Article.all.each do |article|
        authors_count[article.author] += 1 if article.magazine == self#instance of the magazine
    end
    #return an array of authors who have written more than 2 books
    authors_count.select{|author, count|count > 2}.key

  end
end

magazine = Magazine.new("This is Ruby", "Programming")
author = Author.new("Sophie")
article = Article.new(author, magazine, "Programming Language")
author.add_article(magazine, "Ruby introduction")
p article.author
p article.magazine
p author.articles
p author.magazines
p magazine.contributors
p author.add_article(magazine, "Ruby introduction")

