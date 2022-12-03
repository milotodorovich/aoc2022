input = <<INPUT
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
HLVHsVWLwbWswbpWFWrrmThfTPNnhNSDDNhDfznTnhnS
INPUT

input = File.read("data/input03.txt")

rucksacks = input.split("\n")
puts rucksacks

sum = rucksacks.map do |sack|
    puts sack.chars.first(sack.size/2).join
    puts sack.chars.last(sack.size/2).join  
    puts sack.chars.first(sack.size/2).intersection(sack.chars.last(sack.size/2)).first
    sack.chars.first(sack.size/2).intersection(sack.chars.last(sack.size/2)).first
end.map do |c|
    puts c.chr
    puts c.ord
    value = c.ord
    if c == c.upcase
        value = value - 38
    else
        value = value - 96
    end
    puts value
    value
end.sum

puts "Sum: #{sum}"