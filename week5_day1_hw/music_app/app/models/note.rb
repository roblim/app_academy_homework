# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  track_id   :integer          not null
#  note_body  :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ApplicationRecord
  validates :user_id, :track_id, :note_body, presence: true

  belongs_to :track,
    foreign_key: :track_id,
    primary_key: :id,
    class_name: :Track

  belongs_to :user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

end
