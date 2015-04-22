# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  kind       :string           not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  validates :title, :kind, :band_id, presence: true
  validates :kind, inclusion: { in: %w(live studio),
                                message: '%{value} is not a valid album
                                type (must be live or studio)'}

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
