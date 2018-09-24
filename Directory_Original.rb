@students = Array.new

def input_students
	puts "Please enter the name of the first student. To finish hit return."
	name = gets.delete "\n"
	while !name.empty? do 
		cohort = input_info(name, "cohort")
		age = input_info(name, "age")
		country = input_info(name, "country")
		puts "You have entered:   Name: #{name}  Cohort: #{cohort}  Age: #{age}  Country: #{country}"
		puts "Type 'Yes' to confirm. To start again, type 'No.' To confirm & exit, hit return"
			confirm = gets.chomp
		loop do 
			if (confirm == "yes") or (confirm == "Yes")
				@students << {name: name.to_sym, cohort: cohort.to_sym, country: country.to_sym, age: age.to_sym}
				puts "Now we have #{@students.count} students" if @students.count > 1
				puts "Now we have #{@students.count} students" if @students.count == 1
				puts "No students currently enrolled" if @students.count == 0 
				#get another name from the user 
				puts "Type in the name of the next student, or return to finish."
				name = gets.chomp
				break 
			elsif (confirm == "no") || (confirm == "No")
				puts "Please re-enter the student's information. What is his/her name?"
				name = gets.chomp
				break
			elsif confirm == ""
				@students << {name: name.to_sym, cohort: cohort.to_sym, country: country.to_sym, age: age.to_sym}
				name = ""
				break
			else
				puts "Type 'Yes' to confirm. To start again, type 'No'. To confirm & exit, hit return"
				confirm = gets.chomp
			end
		end
	end
	#return the array of students
	@students 
end 

def input_info(name, fact)
	puts "Please enter the #{fact.upcase} for #{name}:"
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

input_students
print_header
print_students
print_footer
