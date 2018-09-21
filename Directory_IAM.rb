@students = [] # an empty array accessible by all files

def try_load_students
  filename = ARGV.first # first argument from the command command line
  if filename.nil?
    load_students
    puts "Loaded #{@students.count} from students.csv"
  else File.exists?(filename) #if it exists
    load_students(filename)
    "Loaded #{@students.count} from #{filename}"
  end
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_students(name, cohort)
    end
  end
end

def interactive_load_students
  load_students(file_location)
end

def add_students(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_students(name)
    print "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def file_location
  puts "Please enter a file location to use. Hit return to use students.csv"
  location = gets.chomp
  location = "students.csv" if location == ""
  return location
end

def save_students
  File.open(file_location, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
    puts "Task successfully completed."
  end
end

def process(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then interactive_load_students
    when "9" then exit # this will cause the program to terminate.
    else
      puts "I don't know what you meant, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit" # because we'll be adding more items
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_student_list
  if @students.empty? != true
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def show_students
  print_header
  print_student_list
  print_footer
end

try_load_students
interactive_menu
