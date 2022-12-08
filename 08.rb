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
pp rows
pp cols

visibles = []

rows.each_with_index do |row, x| 
    visible_row = []
    row.each_with_index do |tree, y|
        puts "Tree: #{tree}"
        puts "Row: #{row}"
        puts "Col: #{cols[y]}"
        left = row.slice(0, y)
        right = row.slice(y+1, row.length)
        up = cols[y].slice(0, x)
        down = cols[y].slice(x+1, cols[y].length)
        puts "Max: L:#{left} R:#{right} U:#{up} D:#{down}"
        max_left = row.slice(0, y).max || -1
        max_right = row.slice(y+1, row.length).max || -1
        max_up = cols[y].slice(0, x).max || -1
        max_down = cols[y].slice(x+1, cols[y].length).max || -1
        # puts "--"
        puts "Max: L:#{max_left} R:#{max_right} U:#{max_up} D:#{max_down}"
        visible_left = tree > max_left
        visible_right = tree > max_right
        visible_up = tree > max_up
        visible_down = tree > max_down
        puts "Visibles: #{visible_left} #{visible_right} #{visible_up} #{visible_down}"
        visible = (
            visible_left || 
            visible_right || 
            visible_up || 
            visible_down )
        puts visible
        visible_row << visible
        # pp visible_row
        puts "--"
    end
    visibles << visible_row
end
pp rows
pp visibles
puts "Part I: #{visibles.flatten.select { |t| t }.count}"