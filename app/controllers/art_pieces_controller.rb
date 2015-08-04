class ArtPiecesController < ApplicationController
  def index
    @art_pieces = ArtPiece.all.page(params[:page])
  end
end
