class CreateCourses < ActiveRecord::Migration[5.0]

  def change
    create_table :courses do |t|
      t.string :name
      t.references :teacher
      t.references :student
    end
  end
end
