
students = []
students_sub = []


def input_students(students)
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
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

#def input_letter
#  puts "Show students starting with a: (leave blank for all)"
#  start_letter = gets.chomp
#end

def group_by(students)
  puts "What column would you like to sort by?:"
  group = gets.chomp.to_sym
  if !group.empty?
    students.sort_by! { |hsh| hsh[group] }
  end
  return group
end

def select_in_group(students, students_sub, group)
  puts "What in the grouo would you like to select on?"
  select_string = gets.chomp
    students.each { |student|
      if student[group].to_s.include? select_string
        students_sub << student
      end
    }
  return select_string
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students_sub)
  #unless letter.empty?
  #  puts "Showing Students starting with: #{letter}"
  #end
  x = 1

  while x <= students_sub.length

    student = students_sub[x-1]
  # students.each.with_index(1) do |student, index|
  #  if letter == student[:name].chr || letter.empty?
  #   if student[group].include? select_string
        puts "#{x}: #{student[:name].center(20)} (#{student[:cohort].to_s.center(20)} cohort) Country of Birth: #{student[:country].to_s.center(20)} DOB: #{student[:DOB].center(12)}"
  #   end
  #  end
  x += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end


students = input_students(students)
#start_letter = input_letter
group = group_by(students)
select_string = select_in_group(students, students_sub, group)
print_header
print(students_sub)
print_footer(students)
