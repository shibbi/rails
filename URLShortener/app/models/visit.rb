# == Schema Information
#
# Table name: visits
#
#  id             :integer          not null, primary key
#  visitor_id     :integer
#  visited_url_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Visit < ActiveRecord::Base
  validates :visitor_id, presence: true
  validates :visited_url_id, presence: true

  belongs_to(
    :visitor,
    class_name: :User,
    foreign_key: :visitor_id,
    primary_key: :id
  )

  belongs_to(
    :visited_url,
    class_name: :ShortenedUrl,
    foreign_key: :visited_url_id,
    primary_key: :id
  )

  def self.record_visit!(user, shortened_url)
    Visit.create!(visitor_id: user.id, visited_url_id: shortened_url.id)
  end
end
