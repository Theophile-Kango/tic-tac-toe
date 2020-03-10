#!/home/manezeu/.rbenv/shims/ruby
class Player
    def initialize(name)
        @name = name
        @choices = []
    end
    def add_choice(choice)
        @choices << choice
    end
    def get_choice
        @choices
    end
end
