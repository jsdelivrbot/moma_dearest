class CreateArtPieces < ActiveRecord::Migration
  def change
    create_table :art_pieces do |t|
      t.string :title
      t.string :artist
      t.string :medium
      t.string :moma_url

      t.timestamps
    end
  end
end
