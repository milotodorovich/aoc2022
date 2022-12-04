input = <<INPUT
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
INPUT

input = File.read("data/input04.txt")

assignments = input.split("\n")
puts "Num assignments: #{assignments.length}"

result = 0
overlap = 0

assignments.each do |a|
    elves = a.split(",")
    a1 = elves[0].split("-")
    r1 = *(a1[0]..a1[1])

    a2= elves[1].split("-")
    r2 = *(a2[0]..a2[1])

    unless (r1 | r2).size > [r1.size, r2.size].max
        result = result + 1
    end

    if (r1 & r2).size > 0
        overlap = overlap + 1
    end
end

puts "Result (part 1): #{result}"
puts "Result (part 2): #{overlap}"