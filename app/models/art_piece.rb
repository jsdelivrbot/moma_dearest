# == Schema Information
#
# Table name: art_pieces
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  artist     :string(255)
#  medium     :string(255)
#  momaUrl    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ArtPiece < ActiveRecord::Base
  paginates_per 12
end
