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

Point = Struct.new(:name, :x, :y) do
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
            return 
        end
        if head.x - x > 1
            self.x = x + 1
            self.y = case 
            when head.y > self.y 
                y + 1 
            when head.y < self.y
                y - 1
            else 
                y
            end
        elsif head.x - x < -1
            self.x = x - 1
            self.y = case
            when head.y > self.y  
                y + 1 
            when head.y < self.y
                y - 1
            else 
                y
            end
        elsif head.y - y > 1
            self.y = y + 1
            self.x = case
            when head.x > self.x  
                x + 1 
            when head.x < self.x
                x - 1
            else
                x
            end
        elsif head.y - y < -1
            self.y = y - 1
            self.x = case 
            when head.x > self.x 
                x + 1 
            when head.x < self.x 
                x - 1
            else 
                x
            end
        else
            puts "PANIC - should never get here!!!"
            pp head
            pp self
            exit 1
        end
    end
end

knots = [
    Point.new("H", 0,0),
    Point.new("T", 0,0)
]
puts "Start"
pp knots

visited = []
visited << knots.last.to_a

moves.each do |m|
    direction, times = m.split(" ")
    times.to_i.times do
        knots[0].move(direction)
        knots[1].follow(knots[0])
        visited << knots.last.to_a
    end
end

# pp visited
puts "Part I: #{visited.uniq.size}"

# input = <<input
# r 5
# u 8
# l 8
# d 3
# r 17
# d 10
# l 25
# u 20
# input
moves = input.split("\n")

knots = [
    Point.new("H", 0,0),
    Point.new("1", 0,0),
    Point.new("2", 0,0),
    Point.new("3", 0,0),
    Point.new("4", 0,0),
    Point.new("5", 0,0),
    Point.new("6", 0,0),
    Point.new("7", 0,0),
    Point.new("8", 0,0),
    Point.new("T", 0,0)
]
puts "Start"
pp knots

visited = []
visited << knots.last.to_a

moves.each do |m|
    direction, times = m.split(" ")

    times.to_i.times do
        knots[0].move(direction)
        knots[1].follow(knots[0])
        (knots.size - 1).times do |i|
            knots[i+1].follow(knots[i])
        end

        visited << knots.last.to_a
    end
    
end

pp knots
puts "Part II: #{visited.uniq.size}"