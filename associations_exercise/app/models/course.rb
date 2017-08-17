# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  prereq_id     :integer
#  instructor_id :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ApplicationRecord
  validates :name, :instructor_id, presence: true

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: 'Enrollment'

  has_many :enrolled_students,
    through: :enrollments,
    source: :user

  belongs_to :prerequisite,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: 'Course'

  belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: 'User'
end
