class CharactersController < ApplicationController
  def capture
    cur = Character.find(params[:id])
    cur.player_id = current_player.id
    cur.save
    redirect_to root_url
  end

  def damage
    @victim = Character.find(params[:id]) # The Character being attacked
    @victim.health -= 10
    $player = @victim.player_id # Saves the Player being attacked for the redirect
    @victim.save
  end

  def level_up # Called after damage.html.erb form
    attacker = Character.find_by(name: character_params[:name])
    attacker.experience += 10 # Attacker gains experience
    if attacker.experience >= 100  # If Attacker EXP goes to 100
      attacker.level += 1          # Then Attacker levels up
      attacker.experience = 0      # And their EXP resets
    end
    attacker.save
    redirect_to Player.find($player) # Redirects to page of the attacked Player
  end

  def heal
    cur = Character.find(params[:id])
    cur.health += 10
    cur.save
    redirect_to Player.find(cur.player_id)
  end

  def new
    @character = Character.new
    @characters = Character.all
  end

  def create
    @character = Character.new(character_params)
    @character.health = 100 # default values for a new Character
    @character.level = 1
    @character.strength = 10
    @character.magic = 10
    @character.experience = 10
    @character.player_id = current_player.id
    if @character.save
      redirect_to current_player
    else # Error creating player (e.g. due to failing validation)
      flash[:error] = @character.errors.full_messages.to_sentence
      redirect_to(:back) # Goes back to the form
    end
  end

  private # strong parameters for security
    def character_params
      params.require(:character).permit(:name)
    end
end
