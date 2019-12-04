
def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  students = []
  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  return students
end

def input_letter
  puts "Show students starting with a: (leave blank for all)"
  start_letter = gets.chomp
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students, letter)
  unless letter.empty?
    puts "Showing Students starting with: #{letter}"
  end
  puts letter
  students.each.with_index(1) do |student, index|
    if letter == student[:name].chr || letter.empty?
      if student[:name].length < 12
        puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
start_letter = input_letter
print_header
print(students, start_letter)
print_footer(students)
