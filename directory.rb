@students = [] # empty array accessible to all methods

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
      @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

# bringing all students into an array
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]
# printing student list
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# printing the total number of students
def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code.
  # If user hits return twice, we return the array of students
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  # students
end

def interactive_menu
  # students = []
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    process(gets.chomp) # passing user selection as an argument to the process method
    # 3. do what the user has asked
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
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      # input the students using the method
      students = input_students
    when "2"
      # show the students
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # terminate the program. Or break?
    else
      puts "I don't understand. Try again"
    end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student| # iteration
    student_data = [student[:name], student[:cohort]] # array which takes the student name and cohort
    csv_line = student_data.join(",") # one line of CSV: join the elements of the array with a comma
    file.puts csv_line # write the CSV line into the file
  end
  file.close
end

# calling the methods
interactive_menu
