# == Schema Information
#
# Table name: tag_topics
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  url_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagTopic < ApplicationRecord
  validates :name, presence: true
  #
  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: 'Tagging'

  has_many :shortened_urls,
    through: :taggings,
    source: :urls


end
