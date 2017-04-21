# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  track_type :string           not null
#  lyrics     :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :name, :album_id, :track_type, :lyrics, null: false

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: "Album"
end
