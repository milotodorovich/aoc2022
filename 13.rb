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

    return false if right.nil?
    
    if left.is_a?(Numeric) && right.is_a?(Numeric)
        return left <= right
    end
    if left.is_a?(Array) && right.is_a?(Numeric)
        return compare(left, Array(right))
    end
    if left.is_a?(Numeric) && right.is_a?(Array)
        return compare(Array(left), right)
    end
    left.each_with_index do |l, i|
        next if l == right[i]
        result = compare(l, right[i])
        return result
    end

    return true
end

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

sum = results.each_with_index.reduce(0) do |memo, (element, index)|
    if element
        memo = memo + index + 1 
    end
    memo
end

puts "Part 1: #{sum}"
