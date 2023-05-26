#initialize a name for author
#name cannot be changed so use attr_reader
#put author name hence sophie

class Author
    
    attr_reader :name
    def initialize name
        @name = name
    end
end

author = Author.new("Sophie")
puts author.name
