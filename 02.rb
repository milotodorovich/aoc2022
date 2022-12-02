input = <<INPUT
A Y
B X
C Z
INPUT

# input = File.read("data/input02.txt")

games = input.split("\n")

points_selected = {
    "X" => 1,
    "Y" => 2,
    "Z" => 3
}

points_outcome = {
    "A X" => 3,
    "A Y" => 6,
    "A Z" => 0,
    "B X" => 0,
    "B Y" => 3,
    "B Z" => 6,
    "C X" => 6,
    "C Y" => 0,
    "C Z" => 3
}

sum = games.map do |game|
    me = game[2]
    points_selected[me] + points_outcome[game]
end.sum

puts "First strategy: #{sum}"

translation = {
    "A X" => "A Z",
    "A Y" => "A X",
    "A Z" => "A Y",
    "B X" => "B X",
    "B Y" => "B Y",
    "B Z" => "B Z",
    "C X" => "C Y",
    "C Y" => "C Z",
    "C Z" => "C X"
}


sum = games.map do |original|
    game = translation[original]
    me = game[2]
    points_selected[me] + points_outcome[game]
end.sum

puts "Second strategy: #{sum}"