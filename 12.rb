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
grid[s.last][s.first] = 'a'
grid[e.last][e.first] = 'z'

visited = {}
queue << [s,0]

while next_node = queue.shift
    x = next_node.first.first
    y = next_node.first.last
    steps = next_node.last

    if visited[[x,y]] && steps >= visited[[x, y]]
        next
    end
    visited[[x,y]] = steps
    next if e == [x,y]

    if y+1 < grid.length
        if grid[y+1][x].ord - grid[y][x].ord <= 1
            queue << [[x, y+1], steps + 1]
        end
    end
    if x+1 < grid[0].length
        if grid[y][x+1].ord - grid[y][x].ord <= 1
            queue << [[x+1, y], steps + 1]
        end
    end
    if y-1 >= 0 
        if grid[y-1][x].ord - grid[y][x].ord <= 1
            queue << [[x, y-1], steps + 1]
        end
    end
    if x-1 >= 0 
        if grid[y][x-1].ord - grid[y][x].ord <= 1
            queue << [[x-1, y], steps + 1]
        end
    end
end

puts "Part 1: #{visited[e]}"

candidates = []
grid.each_with_index do |row, y|
    row.each_with_index do |col, x|
        candidates << [x, y] if col == "a"
    end
end

results = []
candidates.each do |starter|
    visited.clear
    queue.clear
    queue << [starter,0]

    while next_node = queue.shift
        x = next_node.first.first
        y = next_node.first.last
        steps = next_node.last

        if visited[[x,y]] && steps >= visited[[x, y]]
            next
        end
        visited[[x,y]] = steps
        next if e == [x,y]

        if y+1 < grid.length
            if grid[y+1][x].ord - grid[y][x].ord <= 1
                queue << [[x, y+1], steps + 1]
            end
        end
        if x+1 < grid[0].length
            if grid[y][x+1].ord - grid[y][x].ord <= 1
                queue << [[x+1, y], steps + 1]
            end
        end
        if y-1 >= 0 
            if grid[y-1][x].ord - grid[y][x].ord <= 1
                queue << [[x, y-1], steps + 1]
            end
        end
        if x-1 >= 0 
            if grid[y][x-1].ord - grid[y][x].ord <= 1
                queue << [[x-1, y], steps + 1]
            end
        end
    end

    results << visited[e]
end

puts "Part 2: #{results.compact.min}"
