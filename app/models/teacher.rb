class Teacher < ActiveRecord::Base
  has_many :courses
  has_many :announcements, through: :courses
  has_many :notes, through: :courses
  has_many :assignments, through: :courses


  def courses
    instance_of_teacher.map do |course|
      course.name
    end
  end

  def add_announcement(course, title, entry)
    Announcement.create(course: course, title: title, entry: entry)
  end

  def delete_announcement(title)
    Announcement.where(title: title).destroy_all
  end

  def add_assignment(course, title, entry)
    Assignment.create(course: course, title: title, entry: entry)
  end

  def delete_assignment(title)
    Assignment.where(title: title).destroy_all
  end

  def add_note(course, title, entry)
    Note.create(course: course, title: title, entry: entry)
  end

  def delete_note(title)
    Note.where(title:title).destroy_all
  end




  private
  def instance_of_teacher
    Course.all.select do |course|
      course.teacher == self
    end
  end

end
