# == Schema Information
#
# Table name: tracks
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  track_number :integer          not null
#  bonus        :boolean          default(FALSE)
#  album_id     :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Track < ApplicationRecord
  validates :title, :track_number, :bonus, :album_id, presence: true

  belongs_to :album,
    foreign_key: :album_id,
    primary_key: :id,
    class_name: :Album

  has_one :band,
    through: :album,
    source: :band

  has_many :notes,
    foreign_key: :track_id,
    primary_key: :id,
    class_name: :Note
end
