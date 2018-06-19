class Student < ActiveRecord::Base
  has_many :courses

  def my_courses_and_teachers
    instance_of_student.map do |course|
      "#{course.name} -- #{course.teacher.name}"
    end
  end

  def view_assignments(course_name)
    Course.all.find do |course|
      course.name == course_name
    end.assignments
  end

  def view_notes(course_name)
    Course.all.find do |course|
      course.name == course_name
    end.notes
  end

  def view_announcements(course_name)
    Course.all.find do |course|
      course.name == course_name
    end.announcements
  end

  private
  def instance_of_student
    Course.all.select do |course|
      course.student == self
    end
  end


end
