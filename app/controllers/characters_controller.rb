class CharactersController < ApplicationController
  def capture
    cur = Character.find(params[:id])
    cur.player_id = current_player.id
    cur.save
    redirect_to root_url
  end

  def damage
    $victim = Character.find(params[:id]) # Saves the Character being attacked
    $player = $victim.player_id # Saves the Player being attacked for the redirect
  end

  def level_up # Called after damage.html.erb form
    # Extracts the elements used for the attacking and victim characters
    attacker_element = character_params[:element]
    victim_element = ["Earth", "Wind", "Fire", "Water"].sample

    # Generates the attacking character's damage multiplier (0.7 to 1.3)
    critical = Random.new
    critical_damage = critical.rand(0.7..1.3)

    # Determines the attacking character's element multiplier
    element_multiplier = 1
    if ((attacker_element == "Water") and (victim_element == "Fire")) or
       ((attacker_element == "Fire") and (victim_element == "Earth")) or
       ((attacker_element == "Earth") and (victim_element == "Wind")) or
       ((attacker_element == "Wind") and (victim_element == "Water"))
       element_multiplier = 2
    end

    # Calculates the attacking character's total damage
    base_damage = 10
    total_damage = base_damage * element_multiplier * critical_damage

    # Updates the victim character's health after the damage is done
    $victim.health -= total_damage
    $victim.save

    # Updates the attacking character's experience after the damage is done
    attacker = Character.find_by(name: character_params[:name])
    attacker.experience += 10 # Attacker gains experience
    if attacker.experience >= 100  # If Attacker EXP goes to 100
      attacker.level += 1          # Then Attacker levels up
      attacker.experience = 0      # And their EXP resets
    end
    attacker.save

    # Redirects to page of the attacked Player
    redirect_to Player.find($player)
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
