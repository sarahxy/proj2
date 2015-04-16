class HomeController < ApplicationController

  def index
    playerless_character = Character.where(player:nil)
    @character = playerless_character.sample
  end

end
