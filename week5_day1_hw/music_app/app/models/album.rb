# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :integer          not null
#  live       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :year, :band_id, :live, presence: true

  belongs_to :band,
    foreign_key: :band_id,
    primary_key: :id,
    class_name: :Band

  has_many :tracks,
    foreign_key: :album_id,
    primary_key: :id,
    class_name: :Track

end
