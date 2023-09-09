require './teacher'
require './student'
require './book'
require './rental'

ACTIONS = {
  1 => :list_all_books,
  2 => :list_all_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_rentals_by_person_id,
  7 => :break
}.freeze

class App
  attr_reader :books, :people

  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  def options
    puts ''
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def select
    loop do
      options
      option = gets.chomp.to_i
      action = ACTIONS[option]

      if action == :break
        puts 'Thank you for using this app!'
        break
      elsif action
        send(action)
      else
        puts 'Error: Invalid number, try again'
      end
    end
  end

  def list_all_books
    books.each do |book, _index|
      puts("Title: #{book.title}, Author: #{book.author}")
    end
  end

  def list_all_people
    people.each do |person|
      puts("[#{person.is_a?(Student) ? 'Student' : 'Teacher'}]
      Name: #{person.name},
      ID: #{person.id},
      Age: #{person.age}")
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    number = gets.chomp.to_i

    case number
    when 1
      print('Age: ')
      age = gets.chomp
      print('Name: ')
      name = gets.chomp
      print('Has parent permission? [Y/N]: ')
      parent_permission_console = gets.chomp.capitalize
      if parent_permission_console == 'N'
        @people.push(Student.new(age, name: name, parent_permission: false))
      elsif parent_permission_console == 'Y'
        @people.push(Student.new(age, name: name, parent_permission: true))
      else
        puts 'Please select between [Y/N]'
      end
      puts('Person created successfully')
    when 2
      print('Age: ')
      age = gets.chomp
      print('Specialization: ')
      specialization = gets.chomp
      print('Name: ')
      name = gets.chomp
      @people.push(Teacher.new(age, specialization, name: name))
      puts('Person created successfully')
    else
      puts("The number #{number} isn't a valid choice, please select number (1) to create a student or (2) to create
      a teacher")
    end
  end

  def create_book
    print('Title: ')
    title = gets.chomp

    print('Author: ')
    author = gets.chomp

    @books.push(Book.new(title, author))
    puts('The book has been created successfully')
  end

  def create_rental
    puts('Select a book from the following list by number')
    books.each_with_index do |book, index|
      puts("#{index}) Title: #{book.title}, Author: #{book.author}")
    end
    book_number = gets.chomp.to_i
    book_selected = books[book_number]

    puts('Select a person from the following list by number (not ID)')
    people.each_with_index do |person, index|
      puts(
        "#{index}) [#{person.is_a?(Student) ? 'Student' : 'Teacher'}]
      Name: #{person.name},
      ID: #{person.id},
      Age: #{person.age}"
      )
    end
    person_number = gets.chomp.to_i
    person_selected = people[person_number]

    print('Date: ')
    date = gets.chomp

    @rentals.push(Rental.new(date, person_selected, book_selected))
  end

  def list_rentals_by_person_id
    print('ID of person: ')
    id = gets.chomp.to_i

    puts 'Rentals: '
    @rentals.each do |rental|
      if rental.is_a?(Book)
        next
      end
      puts("Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}") if rental.person.id == id

      
    end
  end
end
