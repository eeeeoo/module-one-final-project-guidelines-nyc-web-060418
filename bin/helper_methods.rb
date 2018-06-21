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

  welcome_title = <<-TITLE


   ▄█     ▄████████  ▄██████▄  ███▄▄▄▄           ▄████████  ▄████████    ▄█    █▄     ▄██████▄   ▄██████▄   ▄█
  ███    ███    ███ ███    ███ ███▀▀▀██▄        ███    ███ ███    ███   ███    ███   ███    ███ ███    ███ ███
  ███▌   ███    ███ ███    ███ ███   ███        ███    █▀  ███    █▀    ███    ███   ███    ███ ███    ███ ███
  ███▌  ▄███▄▄▄▄██▀ ███    ███ ███   ███        ███        ███         ▄███▄▄▄▄███▄▄ ███    ███ ███    ███ ███
  ███▌ ▀▀███▀▀▀▀▀   ███    ███ ███   ███      ▀███████████ ███        ▀▀███▀▀▀▀███▀  ███    ███ ███    ███ ███
  ███  ▀███████████ ███    ███ ███   ███               ███ ███    █▄    ███    ███   ███    ███ ███    ███ ███
  ███    ███    ███ ███    ███ ███   ███         ▄█    ███ ███    ███   ███    ███   ███    ███ ███    ███ ███▌    ▄
  █▀     ███    ███  ▀██████▀   ▀█   █▀        ▄████████▀  ████████▀    ███    █▀     ▀██████▀   ▀██████▀  █████▄▄██
         ███    ███                                                                                        ▀


  TITLE

  puts welcome_title

  puts "Welcome!"

  $user_email = $prompt.ask('Please enter your school email?') do |q|
    q.validate(/\A\w+@\w+\.\w+\Z/)
    q.messages[:valid?] = 'Invalid email address'

  end

  while !(Teacher.teacher_emails.include?($user_email)) && !(Student.student_emails.include?($user_email))
    puts "Please, contact Iron School's administration at administration@ironschool.com."
    $user_email = $prompt.ask('Or you can try again: ') do |q|
      q.validate(/\A\w+@\w+\.\w+\Z/)
      q.messages[:valid?] = 'Invalid email address'
    end
  end

  if Student.student_emails.include?($user_email)
    user = "Student"
  else
    user = "Teacher"
  end

  $user_type = $prompt.select("Choose user type?", %w(Student Teacher))

  while user != $user_type
    $user_type = $prompt.select("Wrong user type. Please, try again: ", %w(Student Teacher))
  end

  course_list
end


def exit_app
  puts "Successful logout."
  exit
end

###############################################

def course_list
  course_title = <<-TITLE

    ╔═╗┌─┐┬ ┬┬─┐┌─┐┌─┐┌─┐  ╔╦╗┌─┐┌┐┌┬ ┬
    ║  │ ││ │├┬┘└─┐├┤ └─┐  ║║║├┤ ││││ │
    ╚═╝└─┘└─┘┴└─└─┘└─┘└─┘  ╩ ╩└─┘┘└┘└─┘

  TITLE
  puts "================================================================================================"
  puts course_title

  if $user_type == "Teacher"
    $user_teacher = Teacher.all.find {|teacher_inst|    teacher_inst.email == $user_email}

    course = $prompt.select("Choose a course to view info:", [$user_teacher.courses, "Logout"].flatten)

    exit_app if course == "Logout"

    $course_obj = Course.all.find {|course_inst| course_inst.name == course}

  else
    $user_student = Student.all.find {|student_inst|
      student_inst.email == $user_email}

    course = $prompt.select("Choose a course to view info:", [$user_student.courses_and_teachers, "Logout"].flatten)

    exit_app if course == "Logout"

    $course_obj = Course.all.find {|course_inst| course_inst.name == course.split(" -- ")[0]}
  end
  select_material
end

##############################################

def select_material
  materials_title = <<-TITLE

    ╔╦╗┌─┐┌┬┐┌─┐┬─┐┬┌─┐┬  ┌─┐  ╔╦╗┌─┐┌┐┌┬ ┬
    ║║║├─┤ │ ├┤ ├┬┘│├─┤│  └─┐  ║║║├┤ ││││ │
    ╩ ╩┴ ┴ ┴ └─┘┴└─┴┴ ┴┴─┘└─┘  ╩ ╩└─┘┘└┘└─┘

  TITLE

  loop do
    puts "================================================================================================"
    puts materials_title

    view_category = $prompt.select("What do you want to view?", ["Announcements", "Notes", "Assignments", "Go back", "Logout"])

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

    elsif view_category == "Go back"
      course_list

    else
      exit_app
    end
  end

end


#################


def announcement
  announcement_title = <<-TITLE

    ╔═╗┌┐┌┌┐┌┌─┐┬ ┬┌┐┌┌─┐┌─┐┌┬┐┌─┐┌┐┌┌┬┐┌─┐  ╔╦╗┌─┐┌┐┌┬ ┬
    ╠═╣│││││││ ││ │││││  ├┤ │││├┤ │││ │ └─┐  ║║║├┤ ││││ │
    ╩ ╩┘└┘┘└┘└─┘└─┘┘└┘└─┘└─┘┴ ┴└─┘┘└┘ ┴ └─┘  ╩ ╩└─┘┘└┘└─┘

  TITLE

  loop do
    puts "================================================================================================"
    puts announcement_title

    to_do = $prompt.select("What do you want to do in announcements?", ["View announcements", "Add an announcement", "Delete an announcement", "Go back", "Logout"])

    if to_do == "View announcements"
      show_announcements

    elsif to_do == "Add an announcement"
      add_announcement

    elsif to_do == "Delete an announcement"
      delete_announcement

    elsif to_do == "Go back"
      select_material

    else
      exit_app
    end
  end

end


def show_announcements
  puts "Annoucements:"
  $course_obj.announcements
  puts ""
  press = $prompt.keypress("Press \'b\' to go back")
  if press == 'b' || press == 'B'
    if $user_type == "Student"
      select_material
    else
      announcement
    end
  end
end


def add_announcement
  puts "You will be prompted to enter a title, then a description."
  hash = $prompt.collect do
    key(:title).ask('Announcement title:')
    key(:entry).ask('Announcement description:')
  end
  title = hash[:title]
  entry = hash[:entry]
  $user_teacher.add_announcement($course_obj, title, entry)
  puts "Added announcement!"
end

def delete_announcement
  title = $prompt.select("Which announcement do you want to delete?", [$course_obj.announcement_titles, "Go back"].flatten)
  if title != "Go back"
    $user_teacher.delete_announcement(title)
    puts "Deletion successful!"
  end
end

###############


def note
  note_title = <<-TITLE

    ╔╗╔┌─┐┌┬┐┌─┐┌─┐  ╔╦╗┌─┐┌┐┌┬ ┬
    ║║║│ │ │ ├┤ └─┐  ║║║├┤ ││││ │
    ╝╚╝└─┘ ┴ └─┘└─┘  ╩ ╩└─┘┘└┘└─┘

  TITLE

  loop do
    puts "================================================================================================"
    puts note_title
    to_do = $prompt.select("What do you want to do to your lecture notes?", ["View notes", "Add a note", "Delete a note", "Go back", "Logout"])

    if to_do == "View notes"
      show_notes

    elsif to_do == "Add a note"
      add_note

    elsif to_do == "Delete a note"
      delete_note

    elsif to_do == "Go back"
      select_material

    else
      exit_app
    end
  end

end



def show_notes
  puts "Notes"
  $course_obj.notes
  puts ""
  press = $prompt.keypress("Press \'b\' to go back")
  if press == 'b' || press == 'B'
    if $user_type == "Student"
      select_material
    else
      note
    end
  end
end



def add_note
  puts "You will be prompted to enter a title, then a description."
  hash = $prompt.collect do
    key(:title).ask('Lecture title:')
    key(:entry).ask('Lecture description:')
  end
  title = hash[:title]
  entry = hash[:entry]
  $user_teacher.add_note($course_obj, title, entry)
  puts "Added lecture note!"
end

def delete_note
  title = $prompt.select("Which lecture note do you want to delete?", [$course_obj.note_titles, "Go back"].flatten)
  if title != "Go back"
    $user_teacher.delete_note(title)
    puts "Deletion successful!"
  end
end

##########


def assignment

  assignment_title = <<-TITLE

    ╔═╗┌─┐┌─┐┬┌─┐┌┐┌┌┬┐┌─┐┌┐┌┌┬┐┌─┐  ╔╦╗┌─┐┌┐┌┬ ┬
    ╠═╣└─┐└─┐││ ┬││││││├┤ │││ │ └─┐  ║║║├┤ ││││ │
    ╩ ╩└─┘└─┘┴└─┘┘└┘┴ ┴└─┘┘└┘ ┴ └─┘  ╩ ╩└─┘┘└┘└─┘

  TITLE

  loop do
    puts "================================================================================================"
    puts assignment_title
    to_do = $prompt.select("What do you want to do with your assignments?", ["View assignments", "Add an assignment", "Delete an assignment", "Go back", "Logout"])

    if to_do == "View assignments"
      show_assignments

    elsif to_do == "Add an assignment"
      add_assignment

    elsif to_do == "Delete an assignment"
      delete_assignment

    elsif to_do == "Go back"
      select_material

    else
      exit_app
    end
  end

end


def show_assignments
  puts "Assignments:"
  $course_obj.assignments
  puts ""
  press = $prompt.keypress("Press \'b\' to go back")
  if press == 'b' || press == 'B'
    if $user_type == "Student"
      select_material
    else
      assignment
    end
  end
end



def add_assignment
  puts "You will be prompted to enter a title, then a description."
  hash = $prompt.collect do
    key(:title).ask('Assignment title:')
    key(:entry).ask('Assignment description:')
  end
  title = hash[:title]
  entry = hash[:entry]
  $user_teacher.add_assignment($course_obj, title, entry)
  puts "Added assignment!"
end

def delete_assignment
  title = $prompt.select("Which assignment do you want to delete?", [$course_obj.assignment_titles, "Go back"].flatten)
  if title != "Go back"
    $user_teacher.delete_assignment(title)
    puts "Deletion successful!"
  end
end
