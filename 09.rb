input = <<INPUT
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2
INPUT

input = File.read("data/input09.txt")

moves = input.split("\n")

Point = Struct.new(:x, :y) do
    def move(direction)
        case direction
        when "R"
            self.x = x + 1
        when "L"
            self.x = x - 1
        when "U"
            self.y = y + 1
        when "D"
            self.y = y - 1
        else
            puts "PANIC - unknown direction #{direction}"
            exit 1
        end
    end

    def follow(head) 
        if (head.x - x).abs <=1 && (head.y - y).abs <= 1 
            # puts "Early return"
            # pp head
            # pp self
            # puts "****"
            return 
        end
        if head.x - x > 1
            self.x = x + 1
            self.y = head.y
        elsif head.x - x < -1
            self.x = x - 1
            self.y = head.y
        elsif head.y - y > 1
            self.y = y + 1
            self.x = head.x
        elsif head.y - y < -1
            self.y = y - 1
            self.x = head.x
        else
            puts "PANIC - should never get here!!!"
            pp head
            pp self
            exit 1
        end
    end
end
# pp Point.instance_methods.sort

head_position = Point.new(0,0)
tail_position = Point.new(0,0)
puts "Start"
        pp head_position
        pp tail_position

visited = []
visited << tail_position.to_a

moves.each do |m|
    direction, times = m.split(" ")
    times.to_i.times do
        head_position.move(direction)
        tail_position.follow(head_position)
        visited << tail_position.to_a
    end
end

pp visited
puts "Part I: #{visited.uniq.size}"