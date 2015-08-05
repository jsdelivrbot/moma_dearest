class AddMomaNumToArtPiece < ActiveRecord::Migration
  def change
    add_column :art_pieces, :moma_num, :String
  end
end
