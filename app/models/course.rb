class Course < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student
  has_many :announcements
  has_many :notes
  has_many :assignments

  def announcements
    instance_announcements.each do |announce|
      puts "+ " + announce.title
      puts "    " + announce.entry + "\n"
    end
  end

#   def add_announcement(title, entry)
#     Announcement.create(self, title: title, entry: entry)
#   end
#
#   def delete_announcement
#     instance_announcements.where(title: title).destroy_all
#   end
#
# # *******************************
  def assignments
    instance_assignments.each do |assign|
      puts "+ " + assign.title
      puts "    " + assign.entry + "\n"
    end
  end
#
#   def add_assignment(title, entry)
#     Assignment.create(title: title, entry: entry)
#   end
#
#   def delete_assignment
#     instance_assignments.where(title: title).destroy_all
#   end
#
#   # *******************************
  def notes
    instance_notes.each do |note|
      puts "+ " + note.title
      puts "    " + note.entry + "\n"
    end
  end
#
#   def add_note(:title, :entry)
#
#   end
#
#   def delete_note(title)
#     instance_notes.where(title: title).destroy_all
#   end




  private
  def instance_announcements
    Announcement.all.select do |announce|
      announce.course == self
    end
  end

  def instance_assignments
    Assignment.all.select do |assign|
      assign.course == self
    end
  end

  def instance_notes
    Note.all.select do |note|
      note.course == self
    end
  end

end
