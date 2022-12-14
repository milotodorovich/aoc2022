require 'json'

input = <<INPUT
[1,1,3,1,1]
[1,1,5,1,1]

[[1],[2,3,4]]
[[1],4]

[9]
[[8,7,6]]

[[4,4],4,4]
[[4,4],4,4,4]

[7,7,7,7]
[7,7,7]

[]
[3]

[[[]]]
[[]]

[1,[2,[3,[4,[5,6,7]]]],8,9]
[1,[2,[3,[4,[5,6,0]]]],8,9]
INPUT

input = File.read("data/input13.txt")

pair_strings = input.split("\n\n")
pairs = pair_strings.map { |s| s.split("\n") }

def compare(left, right)
    puts "Comparing #{left} and #{right}"

    return 0 if left == right
    
    if left.is_a?(Numeric) && right.is_a?(Numeric)
        return left <=> right
    end
    if left.is_a?(Array) && right.is_a?(Numeric)
        return compare(left, Array(right))
    end
    if left.is_a?(Numeric) && right.is_a?(Array)
        return compare(Array(left), right)
    end
    left.each_with_index do |l, i|
        next if l == right[i]
        return 1 if right[i].nil?
        in_order = compare(l, right[i])
        next if in_order == 0
        return in_order
    end

    return -1
end

# 37, 12
# puts compare(eval(pairs[0].first), eval(pairs[0].last))
# puts true
# puts compare(eval(pairs[1].first), eval(pairs[1].last))
# puts true
# puts compare(eval(pairs[2].first), eval(pairs[2].last))
# puts compare(eval(pairs[3].first), eval(pairs[3].last))
# puts true
# puts compare(eval(pairs[4].first), eval(pairs[4].last))
# puts compare(eval(pairs[5].first), eval(pairs[5].last))
# puts true
# puts compare(eval(pairs[6].first), eval(pairs[6].last))
# puts compare(eval(pairs[7].first), eval(pairs[7].last))
# exit

results = pairs.map do |p|
    left, right = *p
    puts "L: #{left}"
    puts "R: #{right}"
    r = compare(JSON.parse(left), JSON.parse(right))
    puts r 
    puts "--"
    r
end

pp results

in_order = []

sum = results.each_with_index.reduce(0) do |memo, (element, index)|
    if element != 1
        memo = memo + index + 1 
        in_order << index + 1
    end
    memo
end
puts "3 4 5 6 8 9 10 13 15 17 18 20 25 26 31 33 35 36 40 41 43 44 47 49 50 52 53 54 56 57 58 62 64 66 67 68 69 70 72 74 77 79 83 84 85 86 88 89 90 94 99 102 103 105 106 108 113 114 118 121 122 125 126 137 140 143 145 146 147 149"
pp in_order
puts "Part 1: #{sum}"
