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

require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
