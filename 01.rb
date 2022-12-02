input = <<INPUT
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
INPUT

# input = File.read("data/input01.txt")

elves = input.split("\n\n")

sums = elves.map do |e|
    e.split("\n").map(&:to_i).sum
end

puts "Most calories: #{sums.max}"

top3 = sums.max(3).sum
puts "Top 3 calories: #{top3}"