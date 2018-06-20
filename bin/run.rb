require_relative '../config/environment'
require_all 'app'
require 'pry'




$user_email = nil
$user_type = nil
$course_obj = nil
$user_teacher = nil
$user_student = nil

$prompt = TTY::Prompt.new

def welcome
  puts "Welcome!"

  $user_email = $prompt.ask('What is your school email?') do |q|
    q.validate(/\A\w+@\w+\.\w+\Z/)
    q.messages[:valid?] = 'Invalid email address'
  end

  $user_type = $prompt.select("Choose user type?", %w(Student Teacher))

  course_list
end


###############################################

def course_list

if $user_type == "Teacher"
  $user_teacher = Teacher.all.find {|teacher_inst|    teacher_inst.email == $user_email}

  course = $prompt.select("Choose a course to view info:", $user_teacher.courses)

  $course_obj = Course.all.find {|course_inst| course_inst.name == course}

else
  $user_student = Student.all.find {|student_inst|
    student_inst.email == $user_email}

  course = $prompt.select("Choose a course to view info:", $user_student.courses_and_teachers)

  $course_obj = Course.all.find {|course_inst| course_inst.name == course.split[0]}
end

select_material
end

##############################################

def select_material

  view_category = $prompt.select("What do you want to view?", ["Announcements", "Notes", "Assignments", "Go back"])

  if view_category == "Announcements"
    if $user_type == "Student"
      show_announcements
    else
      announcement
    end
  elsif view_category == "Notes"
    if $user_type == "Student"
      show_notes
    else
      note
    end
  elsif view_category == "Assignments"
    if $user_type == "Student"
      show_assignments
    else
      assignment
    end
  else
    course_list
  end

end


#################


def announcement

  to_do = $prompt.select("What do you want to do in announcements?", ["View announcements", "Add an announcement", "Delete an announcement", "Go back"])

  if to_do == "View announcements"
    show_announcements

  elsif to_do == "Add an announcement"
    puts "You will be prompted to enter a title, then a description."
    hash = $prompt.collect do
      key(:title).ask('Title:')
      key(:entry).ask('Description:')
    end
    title = hash[:title]
    entry = hash[:entry]
    $user_teacher.add_announcement($course_obj, title, entry)

  elsif to_do == "Delete an announcement"
    puts "Enter the title of the announcement you want to delete: "
    hash = $prompt.collect do
      key(:title).ask('Title: ')
    end
    title = hash[:title]
    $user_teacher.delete_announcement(title)

  else
    select_material
  end
  select_material
end

def show_announcements
  $course_obj.announcements
  puts ""
  puts ""
  press = $prompt.keypress("Press \'b\' to go back")
  select_material if press == 'b'
end

###

def note

  to_do = $prompt.select("What do you want to do in notes?", ["View notes", "Add a note", "Delete a note", "Go back"])

  if to_do == "View notes"
    show_announcements
  elsif to_do == "Add a note"

  elsif to_do == "Delete a note"

  else
    select_material
  end

end

def show_notes
  $course_obj.notes
  puts ""
  puts ""
  press = $prompt.keypress("Press \'b\' to go back")
  select_material if press == 'b' ||
end

###

def assignment

  to_do = $prompt.select("What do you want to do in assignments?", ["View assignments", "Add an assignment", "Delete an assignment", "Go back"])

  if to_do == "View assignments"
    show_announcements
  elsif to_do == "Add an assignment"

  elsif to_do == "Delete an assignment"

  else
    select_material
  end

end

def show_assignments
  $course_obj.assignments
  puts ""
  puts ""
  press = $prompt.keypress("Press \'b\' to go back")
  select_material if press == 'b'
end

#################
#################

welcome
