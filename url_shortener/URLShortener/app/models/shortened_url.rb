# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string
#  short_url  :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :user_id, presence: true
  validates :short_url, :long_url, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: 'Visit'

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :user

  has_many :tags,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: 'Tagging'

  has_many :tag_topics,
    through: :tags,
    source: :tag_topic

  def num_clicks
    self.visits.count
  end

  def num_uniques
    # self.visits.map { |visit| visit.user_id }.uniq.length
    # self.visits.select(:user_id).distinct.count
    self.visitors.select(:user_id).count
  end

  def num_recent_uniques
    # .select(:created_at)
    visits = self.visits.where({updated_at:10.minutes.ago..Time.now})
    visits.map { |visit| visit.user_id }.uniq.count
  end

  def self.random_code
    SecureRandom.urlsafe_base64
  end

  def self.generate(options)
    long_url = options[:long_url]
    short_url = ShortenedUrl.random_code
    user_id = options[:user_id]
    ShortenedUrl.create!(long_url:long_url, short_url: short_url, user_id: user_id)
  end
end
