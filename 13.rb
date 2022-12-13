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

# input = File.read("data/input13.txt")

pair_strings = input.split("\n\n")
pairs = pair_strings.map { |s| s.split("\n") }

def compare(left, right)
    puts "Comparing #{left} and #{right}"
    left.each_with_index do |l, i|
        r = right[i]
        return false if r.nil?

        if l.is_a?(Array) || r.is_a?(Array) 
            result = compare(Array(l), Array(r))
            return false unless result
        else
            return true if l < r
            return false if l > r
        end
    end

    return true
end

puts compare(eval(pairs[0].first), eval(pairs[0].last))
puts true
puts compare(eval(pairs[1].first), eval(pairs[1].last))
puts true
puts compare(eval(pairs[2].first), eval(pairs[2].last))
puts compare(eval(pairs[3].first), eval(pairs[3].last))
puts true
puts compare(eval(pairs[4].first), eval(pairs[4].last))
puts compare(eval(pairs[5].first), eval(pairs[5].last))
puts true
puts compare(eval(pairs[6].first), eval(pairs[6].last))
puts compare(eval(pairs[7].first), eval(pairs[7].last))
# exit

results = pairs.map do |p|
    left, right = *p
    puts "L: #{left}"
    puts "R: #{right}"
    r = compare(eval(left), eval(right))
    puts r 
    puts "--"
    r
end

# pp results

sum = results.each_with_index.reduce(0) do |memo, (element, index)|
    memo = memo + index + 1 if element
    memo
end

puts "Part 1: #{sum}"
