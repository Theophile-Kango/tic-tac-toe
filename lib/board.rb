class Board
    attr_accessor :arr
    def initialize
        @arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    end

    def filled_board
        res = false
        @arr.each do |elt|
            res = elt.all?(String)
        end
        res
    end

    def update_board(position, player)
        res = check_pos(position)
        if res
            i = 0
            while i < @arr.length
                j = 0
                while j < @arr.length
                    mark(i, j, position, player)
                    j += 1
                end
                i += 1
            end
        end
        res
    end

    def display_board
        @arr.each do |elt|
            elt.each { |i| yield(i) }
        end
    end

    private
    def mark(index, sub_index, position, player)
        marked = false
        if @arr[index][sub_index] == position
            @arr[index][sub_index] = player.sign
            marked = true
        end
        marked
    end

    def check_pos(position)
        res = false
        @arr.each do |elt|
            res = true if elt.any?(position)
        end
        res
    end
end