@students = [] # empty array accessible to all methods

# bringing all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
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
  # placeholder
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
    when "9"
      exit # terminate the program. Or break?
    else
      puts "I don't understand. Try again"
    end
end

# calling the methods
interactive_menu
