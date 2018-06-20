class Student < ActiveRecord::Base
  has_many :courses

  def courses_and_teachers
    instance_of_student.collect do |course|
      course.name + " -- " + course.teacher.name
    end
  end



  private
  def instance_of_student
    Course.all.select do |course|
      course.student == self
    end
  end


end
