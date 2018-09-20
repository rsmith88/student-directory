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
		cohort = "November" if cohort == ""
		puts "How old is #{name}?"
		age = gets.chomp
		age = "TBD" if age == ""
		puts "What country is #{name} from?"
		country = gets.chomp
		country = "Unkown" if country == ""
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
	puts "The students of my cohort at Makers Academy".center(50)
	puts "-------------".center(50)
end

def print(students)
	row = 0
	while (row < students.length) do
		if students[row][:name].to_s.split("").first == "T"
			if students[row][:name].length < 12
			puts "#{row + 1}. #{students[row][:name]} #{students[row][:age]} #{students[row][:country]} (#{students[row][:cohort]} Cohort)".center(50)
			end
		end
		row += 1
	end
end 

def print_footer(students)
	puts "Overall, we have #{students.count} great students".center(50)
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
