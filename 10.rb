input = <<INPUT
addx 15
addx -11
addx 6
addx -3
addx 5
addx -1
addx -8
addx 13
addx 4
noop
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx -35
addx 1
addx 24
addx -19
addx 1
addx 16
addx -11
noop
noop
addx 21
addx -15
noop
noop
addx -3
addx 9
addx 1
addx -3
addx 8
addx 1
addx 5
noop
noop
noop
noop
noop
addx -36
noop
addx 1
addx 7
noop
noop
noop
addx 2
addx 6
noop
noop
noop
noop
noop
addx 1
noop
noop
addx 7
addx 1
noop
addx -13
addx 13
addx 7
noop
addx 1
addx -33
noop
noop
noop
addx 2
noop
noop
noop
addx 8
noop
addx -1
addx 2
addx 1
noop
addx 17
addx -9
addx 1
addx 1
addx -3
addx 11
noop
noop
addx 1
noop
addx 1
noop
noop
addx -13
addx -19
addx 1
addx 3
addx 26
addx -30
addx 12
addx -1
addx 3
addx 1
noop
noop
noop
addx -9
addx 18
addx 1
addx 2
noop
noop
addx 9
noop
noop
noop
addx -1
addx 2
addx -37
addx 1
addx 3
noop
addx 15
addx -21
addx 22
addx -6
addx 1
noop
addx 2
addx 1
noop
addx -10
noop
noop
addx 20
addx 1
addx 2
addx 2
addx -6
addx -11
noop
noop
noop
INPUT

input = File.read("data/input10.txt")

instructions = input.split("\n")

values_after_cycle = []
idx = 0
values_after_cycle[idx] = 1

instructions.each do |i|
    instruction, value = i.split(" ")
    value = value.to_i
    case instruction
    when "noop"
        values_after_cycle[idx+1] = values_after_cycle[idx]
        idx = idx + 1
    when "addx"
        values_after_cycle[idx+1] = values_after_cycle[idx]
        idx = idx + 1
        values_after_cycle[idx+1] = values_after_cycle[idx] + value
        idx = idx + 1
    else
        puts "problem with this instruction: #{i}"
        exit 1
    end
end

result = 
20 * values_after_cycle[19]  +
60 * values_after_cycle[59]  +
100 * values_after_cycle[99]  +
140 * values_after_cycle[139] +
180 * values_after_cycle[179] +
220 * values_after_cycle[219] 

puts "Part 1: #{result}"


puts "Part 2 (read below):"

values = values_after_cycle.each_slice(40).to_a

values.each do |values_row|
    row = []
    values_row.each_with_index do |v, i| 
       row << if (v..(v+2)).cover?(i+1)
            "#"
       else
            "."
       end 
    end
    rows << row
end

puts rows.map { |r| r.join }