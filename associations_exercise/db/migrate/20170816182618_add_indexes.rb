class AddIndexes < ActiveRecord::Migration[5.1]
  def change
    change_column :courses, :name, :string, null: false
    change_column :courses, :instructor_id, :integer, null: false
    change_column :enrollments, :course_id, :integer, null: false
    change_column :enrollments, :student_id, :integer, null: false
    change_column :users, :name, :string, null: false

    add_index :courses, :name, unique: true
  end
end
