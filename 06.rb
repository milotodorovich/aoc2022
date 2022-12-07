def find_marker(x, len=4)
    i = 0
    while (i < x.length - len + 1) do
        s = x.slice(i, len)
        return (i + len) if s.chars.uniq.length == len
        i += 1
    end
    return 0
end

packet_examples = {
    'mjqjpqmgbljsphdztnvjfqwrcgsmlb' => 7,
    'bvwbjplbgvbhsrlpgdmjqwftvncz' => 5,
    'nppdvjthqldpwncqszvftbrmjlhg' => 6,
    'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg' => 10,
    'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw' => 11
}

packet_examples.each do |k, v|
    r = find_marker(k)
    puts "Error on #{k}; expected #{v} but got #{r}" if r != v 
end

input = File.read("data/input06.txt")
result = find_marker(input)
puts "start_of_packet answer: #{result}"


message_examples = {
    'mjqjpqmgbljsphdztnvjfqwrcgsmlb' => 19,
    'bvwbjplbgvbhsrlpgdmjqwftvncz' => 23,
    'nppdvjthqldpwncqszvftbrmjlhg' => 23,
    'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg' => 29,
    'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw' => 26
}

message_examples.each do |k, v|
    r = find_marker(k, 14)
    puts "Error on #{k}; expected #{v} but got #{r}" if r != v 
end
result = find_marker(input, 14)
puts "start_of_message answer: #{result}"