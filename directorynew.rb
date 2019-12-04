
def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  students = []
  name = gets.chomp

  while !name.empty? do
    puts "Now enter cohort:"
    cohort = gets.chomp.to_sym
    if cohort.empty?
      cohort = :November
    end
    students << {name: name, cohort: cohort, country: :England, DOB: "28/07/1968"}
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
  x = 1
  while x <= students.length

    student = students[x-1]
  # students.each.with_index(1) do |student, index|
    if letter == student[:name].chr || letter.empty?
      if student[:name].length < 12
        puts "#{x}: #{student[:name].center(20)} (#{student[:cohort].to_s.center(20)} cohort) Country of Birth: #{student[:country].to_s.center(20)} DOB: #{student[:DOB].center(12)}"
      end
    end
  x += 1
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
