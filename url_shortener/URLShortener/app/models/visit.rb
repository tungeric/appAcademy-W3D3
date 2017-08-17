# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  url_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Visit < ApplicationRecord
  validates :user_id, :url_id, presence: true

  def self.record_visit!(options)
    user_id = options[:user_id]
    shortened_url = options[:url_id]
    Visit.create!(user_id: user_id, url_id: shortened_url)
  end
  
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: 'ShortenedUrl'

end
