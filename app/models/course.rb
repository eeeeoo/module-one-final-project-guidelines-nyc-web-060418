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

  def announcement_titles
    instance_announcements.map do |announce|
      announce.title
    end
  end



  def assignments
    instance_assignments.each do |assign|
      puts "+ " + assign.title
      puts "    " + assign.entry + "\n"
    end
  end

  def assignment_titles
    instance_assignments.map do |assign|
      assign.title
    end
  end



  def notes
    instance_notes.each do |note|
      puts "+ " + note.title
      puts "    " + note.entry + "\n"
    end
  end

  def note_titles
    instance_notes.map do |note|
      note.title
    end
  end





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
