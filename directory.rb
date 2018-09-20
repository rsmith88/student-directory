def input_students
	puts "Please enter the name of the first student. To finish hit return."
	#puts "To finish just hit return twice"
	#create an empty array
	students =[]
	#get the first name
	name = gets.chomp
	#while the name is not empty, repeat the code
	while !name.empty? do 
		#add the student hash to the array
		puts "What cohort will #{name} be joining?"
		cohort = gets.chomp
		cohort = "TBD" if cohort == ""
		puts "How old is #{name}?"
		age = gets.chomp
		age = "TBD" if age == ""
		puts "What country is #{name} from?"
		country = gets.chomp
		country = "TBD" if country == ""
		puts "You have entered:   Name: #{name}  Cohort: #{cohort}  Age: #{age}  Country: #{country}"
		puts "Type 'Yes' to confirm. To start again, type 'No.' To confirm & exit, hit return"
			confirm = gets.chomp
		loop do 
			if (confirm == "yes") or (confirm == "Yes")
				students << {name: name.to_sym, cohort: cohort.to_sym, country: country.to_sym, age: age.to_sym}
				puts "Now we have #{students.count} students"
				#get another name from the user 
				puts "Type in the name of the next student, or return to finish."
				name = gets.chomp
				break 
			elsif (confirm == "no") || (confirm == "No")
				puts "Please re-enter the student's information. What is his/her name?"
				name = gets.chomp
				break
			elsif confirm == ""
				students << {name: name.to_sym, cohort: cohort.to_sym, country: country.to_sym, age: age.to_sym}
				puts "Now we have #{students.count} students"
				name = ""
				break
			else
				puts "Type 'Yes' to confirm. To start again, type 'No'. To confirm & exit, hit return"
				confirm = gets.chomp
			end
		end
	end
	#return the array of students
	students 
end 


def print_header
	puts "The students by cohort at Makers Academy".center(50)
	puts "-------------".center(50)
end

def print(students)
	cohort = "month"
	students_by_cohort = students.sort_by { |student| student[:cohort]} 
	students_by_cohort.each_with_index do |student, index|
		puts "\n#{student[:cohort]} Cohort" if cohort != "#{student[:cohort]}"
		puts "#{index + 1}. #{student[:name]} #{student[:age]} #{student[:country]}"
		cohort = "#{student[:cohort]}"
	end
end 

def print_footer(students)
	puts "\nOverall, we have #{students.count} great students"
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
