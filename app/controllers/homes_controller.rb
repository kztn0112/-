class HomesController < ApplicationController
  def top
  end

  def index
    @making_genres = MakingGenre.all
    @bread_genres = BreadGenre.all
  end
end
