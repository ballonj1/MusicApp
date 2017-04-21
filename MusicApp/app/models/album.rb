# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  performed  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :name, :band_id, presence: true

  has_many :tracks,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: "Track"

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: "Band"
end
