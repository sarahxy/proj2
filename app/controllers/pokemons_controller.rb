class PokemonsController < ApplicationController
  def capture
    cur = Pokemon.find(params[:id])
    cur.trainer_id = current_trainer.id
    cur.save
    redirect_to root_url
  end

  def damage
    @victim = Pokemon.find(params[:id]) # The Pokemon being attacked
    @victim.health -= 10
    $trainer = @victim.trainer_id
    @victim.save
    # Redirect command was moved to level_up after implementing Pokemon battling
  end

  def level_up # Called after damage.html.erb form
    attacker = Pokemon.find_by(name: pokemon_params[:name])
    attacker.level += 1 # Attacker gains experience and levels up
    attacker.save
    redirect_to Trainer.find($trainer) # Redirects to page of the attacked Trainer
  end

  def heal
    cur = Pokemon.find(params[:id])
    cur.health += 10
    cur.save
    redirect_to Trainer.find(cur.trainer_id)
  end

  def new
    @pokemon = Pokemon.new
    @pokemons = Pokemon.all
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.health = 100
    @pokemon.level = 1
    @pokemon.trainer_id = current_trainer.id
    if @pokemon.save
      redirect_to current_trainer
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      redirect_to(:back) # Goes back to the form
    end
  end

  private
    def pokemon_params
      params.require(:pokemon).permit(:name)
    end
end
