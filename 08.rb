input = <<INPUT
30373
25512
65332
33549
35390
INPUT

input = File.read("data/input08.txt")

rows = input.split("\n").map(&:chars).map { |r| r.map(&:to_i)}
cols = []
rows[0].length.times do |i|
    col = []
    rows.each do |r|
        col << r[i]
    end
    cols << col
end

visibles = []

rows.each_with_index do |row, x| 
    visible_row = []
    row.each_with_index do |tree, y|
        left = row.slice(0, y)
        right = row.slice(y+1, row.length)
        up = cols[y].slice(0, x)
        down = cols[y].slice(x+1, cols[y].length)
        
        max_left = left.max || -1
        max_right = right.max || -1
        max_up = up.max || -1
        max_down = down.max || -1

        visible_left = tree > max_left
        visible_right = tree > max_right
        visible_up = tree > max_up
        visible_down = tree > max_down

        visible = (
            visible_left || 
            visible_right || 
            visible_up || 
            visible_down )
        visible_row << visible
    end
    visibles << visible_row
end
puts "Part I: #{visibles.flatten.select { |t| t }.count}"


def view_score(height, line)
    score = 0
    while (score < line.length)
        score = score + 1
        break if line.first(score).max >= height
    end
    score
end

scores = []
rows.each_with_index do |row, x| 
    score_row = []
    row.each_with_index do |tree, y|
        left = row.slice(0, y)
        right = row.slice(y+1, row.length)
        up = cols[y].slice(0, x)
        down = cols[y].slice(x+1, cols[y].length)

        score_left = view_score(row[y], left.reverse)
        score_right = view_score(row[y], right)
        score_up = view_score(row[y], up.reverse)
        score_down = view_score(row[y], down)
        
        score_row << (score_left * score_right * score_up * score_down)
    end
    scores << score_row
end
puts "Part II: #{scores.flatten.max}"