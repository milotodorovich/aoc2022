input = <<INPUT
    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
INPUT

# input = File.read("data/input05.txt")

stacks, directions = input.split("\n\n")
stack_def = stacks.split("\n").last

stack_cols = {}
stack_def.chars.each do |c|
    if c != " "
        stack_cols[c] = stack_def.index(c)
    end
end

queues = {}
stack_cols.keys.each do |k|
    queues[k] = []
end

stack_def = stacks.split("\n").reverse.slice(1, stack_def.length)
stack_def.each do |row|
    queues.keys.each do |key|
        queues[key] << row[stack_cols[key]] if row[stack_cols[key]] != " "
    end
end

directions.split("\n").each do |d|
    _, num, _, from, _, to = d.split(" ")

    num.to_i.times do
        queues[to] << queues[from].pop
    end
end

answer = []
queues.keys.each do |key|
    answer << queues[key].pop
end
puts "Part 1: #{answer.join}"

queues = {}
stack_cols.keys.each do |k|
    queues[k] = []
end

stack_def = stacks.split("\n").reverse.slice(1, stack_def.length)

stack_def.each do |row|
    queues.keys.each do |key|
        queues[key] << row[stack_cols[key]] if row[stack_cols[key]] != " "
    end
end

directions.split("\n").each do |d|
    _, num, _, from, _, to = d.split(" ")

    take = []
    num.to_i.times do
        take << queues[from].pop
    end
    take.reverse.each do |e|
        queues[to] << e
    end
end

answer = []
queues.keys.each do |key|
    answer << queues[key].pop
end
puts "Part 2: #{answer.join}"
