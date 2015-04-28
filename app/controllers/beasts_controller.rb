class CharactersController < ApplicationController
  def index
    @beasts = Beast.all
  end
end
