input = <<INPUT
Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi
INPUT

input = File.read("data/input12.txt")

grid = input.split("\n").map{ |r| r.chars }

queue = []

def find_endpoints(grid) 
    s = []
    e = []
    grid.each_with_index do |row, j| 
        row.each_with_index do |col, i|
            if col == "S"
                s = [i, j]
            end
            if col == "E"
                e = [i, j]
            end
        end
    end
    return s, e
end

s, e = find_endpoints(grid)
pp s
pp e
puts grid[s.last][s.first]
puts grid[e.last][e.first]
grid[s.last][s.first] = 'a'
grid[e.last][e.first] = 'z'
pp grid

visited = {}
Counted = []
Fast = []

queue << [s,0]

while next_node = queue.shift
    x = next_node.first.first
    y = next_node.first.last
    steps = next_node.last

    # step(next_node.first, next_node.last, grid, 0, visited, e)
    Counted << 1
    puts "Counted: #{Counted.size}" if Counted.size % 1000 == 0
    # puts "Handling #{x} #{y} - #{steps}"
    # pp visited
    if visited[[x,y]] && steps >= visited[[x, y]]
        # puts "FAST TRACK"
        Fast << ""
        # return visited
        puts "Fast   : #{Fast.size}" if Fast.size % 1000 == 0
        next
    end
    visited[[x,y]] = steps
    # pp visited
    # puts "--"
    # current = grid[y][x]
    # return visited if current == 'z'
    next if e == [x,y]

    if y+1 < grid.length
        if grid[y+1][x].ord - grid[y][x].ord <= 1
            # visited = step(x, y+1, grid, steps+1, visited, target)
            queue << [[x, y+1], steps + 1]
        end
    end
    if x+1 < grid[0].length
        if grid[y][x+1].ord - grid[y][x].ord <= 1
            # visited = step(x+1, y, grid, steps+1, visited, target)
            queue << [[x+1, y], steps + 1]
        end
    end
    if y-1 >= 0 
        if grid[y-1][x].ord - grid[y][x].ord <= 1
            # visited = step(x, y-1, grid, steps+1, visited, target)
            queue << [[x, y-1], steps + 1]
        end
    end
    if x-1 >= 0 
        if grid[y][x-1].ord - grid[y][x].ord <= 1
            # visited = step(x-1, y, grid, steps+1, visited, target)
            queue << [[x-1, y], steps + 1]
        end
    end
    # return visited
end

pp visited.size
pp visited.sort
pp visited.size
puts "Counted #{Counted.size}"
puts "Fast    #{Fast.size}"
puts "Part 1: #{visited[e]}"
