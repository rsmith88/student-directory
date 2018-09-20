def input_students
	puts "Please enter the names of the students"
	puts "To finish just hit return twice"
	#create an empty array
	students =[]
	#get the first name
	name = gets.chomp
	#while the name is not empty, repeat the code
	while !name.empty? do 
		#add the student hash to the array
		puts "How old is #{name}?"
		age = gets.chomp
		puts "What country is #{name} from?"
		country = gets.chomp
		students << {name: name, cohort: :November, country: country, age: age}
		puts "Now we have #{students.count} students"
		#get another name from the user 
		name = gets.chomp
	end
	#return the array of students
	students 
end 


def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------"
end

def print(students)
	row = 0
	while (row < students.length) do
		if students[row][:name].split("").first == "T"
			if students[row][:name].length < 12
			puts "#{row + 1}. #{students[row][:name]} #{students[row][:age]} #{students[row][:country]} (#{students[row][:cohort]} cohort)"
			end
		end
		row += 1
	end
end 

def print_footer(students)
	puts "Overall, we have #{students.count} great students"
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
