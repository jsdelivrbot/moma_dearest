class ArtPiecesController < ApplicationController
  def index
    @art_pieces = ArtPiece.page(params[:page])
  end
end
