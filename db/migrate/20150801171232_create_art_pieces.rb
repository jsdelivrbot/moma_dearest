class CreateArtPieces < ActiveRecord::Migration
  def change
    create_table :art_pieces do |t|
      t.string :title
      t.string :artist
      t.string :medium
      t.string :moma_url
      t.string :moma_num

      t.timestamps
    end
  end
end
