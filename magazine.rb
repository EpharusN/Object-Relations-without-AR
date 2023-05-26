#initilize magazine with name and category
#return magazine name and category
#return array of magazine instances

class Magazine
    attr_accessor :name, :category
    @@all = []

    def initialize (name, category)
        @name = name
        @category = category
        @@all << self
    end

    def self.all
        @@all
    end
end

magazine = Magazine.new("This is Ruby", "Programming")
puts magazine.name = "This is Ruby"
puts magazine.category = "Programming"

puts Magazine.all