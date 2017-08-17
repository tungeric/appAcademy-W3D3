# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :name, presence: true

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: 'Enrollment'

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course
end
