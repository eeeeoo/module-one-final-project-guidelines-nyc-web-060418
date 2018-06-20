require_relative '../config/environment'
require_all 'app'
require 'pry'




$user_email = nil
$user_type = nil
$course_obj = nil

$prompt = TTY::Prompt.new

def welcome

puts "Welcome!"

$user_email = $prompt.ask('What is your email?') do |q|
  q.validate(/\A\w+@\w+\.\w+\Z/)
  q.messages[:valid?] = 'Invalid email address'
end

$user_type = $prompt.select("Choose user type?", %w(Student Teacher))

course_list
end


###############################################

def course_list


if $user_type == "Teacher"
  user_teacher = Teacher.all.find {|teacher_inst|    teacher_inst.email == $user_email}


  course = $prompt.select("Choose a course to view info:", user_teacher.courses)

  $course_obj = Course.all.find {|course_inst| course_inst.name == course}

else
  user_student = Student.all.find {|student_inst|
    student_inst.email == $user_email}

  course = $prompt.select("Choose a course to view info:", user_student.courses_and_teachers)

  $course_obj = Course.all.find {|course_inst| course_inst.name == course}
end

view_material
end

##############################################

def view_material

  view_category = $prompt.select("What do you want to view?", ["Go Back", "View announcements", "View notes", "View assignments"])


  if view_category == "View announcements"
    $course_obj.announcements
  elsif view_category == "View notes"
    $course_obj.notes
  elsif view_category == "View assignments"
    $course_obj.assignments
  else
    course_list
  end

end

#################

# def if_a_teacher
#   if $user_type == "Teacher"
#     view_category = $prompt.select("What do you want to view?", ["Go Back", "View announcements", "View notes", "View assignments"])
#   end
# end

# def announcement
#
#   if $user_type == "Teacher"
#     # $course_obj.announcements
#     entry_add_delete = $prompt.select("What do you want to view?", ["Go Back", "Add entry", "Delete entry", "#{$course_obj.announcements}"])
#
#     if entry_add_delete == "Add entry"
#
#     elsif entry_add_delete == "Delete entry"
#
#     else
#       view_material
#     end
#
#
#   end
#
#   # $course_obj.announcements
#
# end
#
# def note
#
#   if $user_type == "Teacher"
#     entry_add_delete = $prompt.select("What do you want to view?", ["Go Back", "Add entry", "Delete entry"])
#     $course_obj.notes
#
#   end
#
#   # $course_obj.notes
#
# end
#
# def assignment
#
#   if $user_type == "Teacher"
#     entry_add_delete = $prompt.select("What do you want to view?", ["Go Back", "Add entry", "Delete entry"])
#   end
#
#   $course_obj.assignments
#
# end

#################
#################

welcome
