class PlayersController < ApplicationController
  before_filter :authenticate_player!

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @characters = Character.all
  end
end
