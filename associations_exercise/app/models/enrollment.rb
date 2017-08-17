# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  course_id  :string           not null
#  student_id :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Enrollment < ApplicationRecord
  validates :course_id, :student_id, presence: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: 'User'

  belongs_to :course,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: 'Course'
end
