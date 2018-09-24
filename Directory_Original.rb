@students = Array.new
@name = "name"

def introduction
	puts "Please enter the name of the first student. To finish hit return."
	@name = gets.delete "\n"
	return @name
end

def input_students
	introduction
	while !@name.empty? do 
		cohort, age, country = input_info("cohort"), input_info("age"), input_info("country")
		puts "You have entered:   Name: #{@name}  Cohort: #{cohort}  Age: #{age}  Country: #{country}"
		confirm(cohort, age, country)
		puts "Type in the name of the student, or return to finish."
		@name = gets.chomp
	end 
	@students 
end 

def print_update
	puts "Now we have #{@students.count} students" if @students.count > 1
	puts "Now we have #{@students.count} students" if @students.count == 1
	puts "No students currently enrolled" if @students.count == 0 
end


def save_students(cohort, age, country)
	@students << {name: @name.to_sym, age: age.to_sym, cohort: cohort.to_sym, country: country.to_sym,}
end

def confirm(cohort, age, country)
	loop do
		puts "Type 'Yes' to confirm. Type 'No' to start again."
		confirm = gets.chomp.upcase
		if confirm == "YES"
			save_students(cohort, age, country)
			return print_update
		elsif confirm == "NO"
			puts "Try again."
			return
		end
	end
end

def input_info(fact)
	puts "Please enter the #{fact.upcase} for #{@name}:"
		fact = gets.chomp
		fact = "TBD" if fact == ""
		return fact 
end

def print_header
	puts "The Students by Cohort at Makers Academy".center(50)
	puts "-------------".center(50)
end

def print_students
	if @students.empty? != true
		cohort = ""
		counter = 0
		students_by_cohort = @students.sort_by { |student| student[:cohort]} 
		students_by_cohort.each_with_index do |student, index|
			if cohort != "#{student[:cohort]}"
				puts "\n#{student[:cohort]} Cohort"
				counter = 1
			end
			puts "#{counter}. #{student[:name]} #{student[:age]} #{student[:country]}"
			cohort = "#{student[:cohort]}"
			counter += 1
		end
	end
end 

def print_footer
	puts "\nCurrently, there are no students enrolled." if @students.count == 0
	puts "\nOverall, we have #{@students.count} great student!" if @students.count == 1
	puts "\nOverall, we have #{@students.count} great students!" if @students.count > 1
end

def output_students
	print_header
	print_students
	print_footer
end


input_students
output_students
