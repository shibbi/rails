# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  kind       :string           not null
#  lyrics     :text
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :title, :kind, :album_id, presence: true
  validates :kind, inclusion: { in: %w(bonus regular),
                                message: '%{value} is not a valid track
                                type (must be bonus or regular)'}

  belongs_to :album

  # maybe later
  has_one :band, through: :album, source: :band
end
