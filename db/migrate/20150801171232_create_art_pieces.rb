class CreateArtPieces < ActiveRecord::Migration
  def change
    create_table :art_pieces do |t|
      t.string :title
      t.string :artist
      t.string :medium
      t.string :momaUrl

      t.timestamps
    end
  end
end
