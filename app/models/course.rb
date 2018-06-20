class Course < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student
  has_many :announcements
  has_many :notes
  has_many :assignments

  def announcements
    result = instance_announcements.each do |announce|
      puts announce.title + "\n   " + announce.entry + "\n"
    end
    # puts result
  end

  def assignments
    result = instance_assignments.each do |assign|
      puts announce.title + "\n   " + announce.entry + "\n"
    end
    # puts result
  end

  def notes
    result = instance_notes.each do |note|
      puts announce.title + "\n   " + announce.entry + "\n"
    end
    # puts result
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
