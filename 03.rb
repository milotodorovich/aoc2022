input = <<INPUT
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
INPUT

# input = File.read("data/input03.txt")

def priority(c)
    if c == c.upcase
        c.ord - 38
    else
        c.ord - 96
    end
end

rucksacks = input.split("\n")

sum = rucksacks.map do |sack|
    sack.chars.first(sack.size/2).intersection(sack.chars.last(sack.size/2)).first
end.map do |c|
    priority(c)
end.sum

puts "Part 1 - Sum: #{sum}"


sum = rucksacks.each_slice(3).map do |a|
    a[0].chars.intersection(a[1].chars).intersection(a[2].chars).first
end.map do |x|
    priority(x)
end.sum
puts "Part 2 - Sum: #{sum}"