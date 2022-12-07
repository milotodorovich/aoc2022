input = <<INPUT
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
INPUT

input = File.read("data/input07.txt")

class Node
    attr_reader :name
    attr_reader :size

    def initialize(name, size=nil)
        @name = name
        @size = size
        @contents = []
    end

    def add_directory(name)
        @contents << Node.new(name)
        return @contents.last
    end
    
    def add_file(name, size)
        @contents << Node.new(name, size)
    end

    def cd(name)
        @contents.select do |n|
            n.name == name
        end.first
    end

    def total_size
        @size || @contents.map { |c| c.total_size }.sum
    end
end

first, *commands = input.split("\n$ ")

navigator = []
# handle first separately
unless first == "$ cd /"
    puts "ERROR parsing first command"
    puts first
    exit -1
end

navigator << Node.new("/")
directories = [navigator.first]

commands.each do |c|
    command, *results = c.split("\n")
    case command
    when "ls" 
        results.each do |content|
            case content
            when /^dir/
                name = content.split(" ").last
                new_dir = navigator.last.add_directory(name)
                directories << new_dir
            else
                size, name = content.split(" ")
                navigator.last.add_file(name, size.to_i)
            end
        end
    when /^cd/
        dir = command.split(" ").last
        if dir == ".."
            navigator.pop
        else
            navigator.push(navigator.last.cd(dir))
        end
    else
        puts "UNKNOWN"
    end
end

puts "Part I"
puts directories.select { |d| d.total_size <= 100000 }.map(&:total_size).sum


puts "Part II"
used_space = navigator.first.total_size
# puts "Used space    #{used_space}"
unused_space = 70000000 - used_space
# puts "Un-used space #{unused_space}"
needed_space = 30000000 - unused_space
# puts "Needed space  #{needed_space}"
# puts "=="
# puts "Result:"
pp directories.map { |d| [d.name, d.total_size]}.select { |d| d[1] >= needed_space}.sort_by { |d| d[1]}.first[1]
