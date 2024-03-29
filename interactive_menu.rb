def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array

  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
  @students << {name: name, cohort: :november}
  puts "Now we have #{@students.count} students"
  # get another name from the user
  name = gets.chomp
  end
end

def load_students(filename = "students.csv")

  file= File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  puts "#{@students.length} students were loaded from the file"
  file.close
end

def try_load_students
  filename = ARGV.first # argument from the command line
  if filename.nil?
    filename = "students.csv"
  end

  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # Doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit program
  end
end





def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "#{@students.length} students were saved to #{file}"
  # file.close
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts " #{student[:name]} ( #{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and put it in to a variable
    # 3. do what the user has asked
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  # show some students_sub
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      # input some students
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      try_load_students
    when "9"
      exit
    else
      puts "I don't recognise that selection. Try again"
  end
end
@students = []
interactive_menu
