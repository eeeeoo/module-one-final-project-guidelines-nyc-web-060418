class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.references :course
      t.string :title
      t.text :entry
    end
  end
end
