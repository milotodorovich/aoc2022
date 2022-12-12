input = <<INPUT
Monkey 0:
  Starting items: 79, 98
  Operation: new = old * 19
  Test: divisible by 23
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 1:
  Starting items: 54, 65, 75, 74
  Operation: new = old + 6
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 2:
  Starting items: 79, 60, 97
  Operation: new = old * old
  Test: divisible by 13
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 3:
  Starting items: 74
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1
INPUT

input = File.read("data/input11.txt")

monkeys = []

monkey_data = input.split("\n\n")

Monkey = Struct.new(:items, :operation, :divisor, :throw_true, :throw_false, :play_count) do

    def push(value)
        items << value
    end

    def play
        self.play_count += 1
        old = items.shift
        val = eval(operation)
        val = val / 3

        divisible = val % divisor == 0
        if divisible
            return val, throw_true
        else
            return val, throw_false
        end
    end

    def play2(m)
        self.play_count += 1
        old = items.shift
        val = eval(operation)
        val = val % m

        divisible = val % divisor == 0
        if divisible
            return val, throw_true
        else
            return val, throw_false
        end
    end
end

monkey_data.each do |monkey_string|
    x = monkey_string.split("\n")
    items = x[1].split(":")[1].split(",").map(&:to_i)
    operation = x[2].split(":")[1]
    divisor = x[3].split(":")[1].split(" ")[2].to_i
    throw_true = x[4].split(":")[1].split(" ")[3].to_i
    throw_false = x[5].split(":")[1].split(" ")[3].to_i

    monkeys << Monkey.new(items, operation, divisor, throw_true, throw_false, 0)
end

20.times do
    monkeys.each do |m|
        while m.items.length > 0
            val, n = m.play
            monkeys[n].push(val)
        end
    end
end


max_counts = monkeys.map { |m| m.play_count }.max(2)
puts "Result part 1: #{max_counts[0] * max_counts[1]}"


monkeys.clear
monkey_data.each do |monkey_string|
    x = monkey_string.split("\n")
    items = x[1].split(":")[1].split(",").map(&:to_i)
    operation = x[2].split(":")[1]
    divisor = x[3].split(":")[1].split(" ")[2].to_i
    throw_true = x[4].split(":")[1].split(" ")[3].to_i
    throw_false = x[5].split(":")[1].split(" ")[3].to_i

    monkeys << Monkey.new(items, operation, divisor, throw_true, throw_false, 0)
end


m = monkeys.each.map(&:divisor)
mm = m.reduce(&:*)

10000.times do |i|
    monkeys.each do |m|
        while m.items.length > 0
            val, n = m.play2(mm)
            monkeys[n].push(val)
        end
    end
end

counts = monkeys.map { |m| m.play_count }
max_counts = counts.max(2)
puts "Result Part 2: #{max_counts[0] * max_counts[1]}"
