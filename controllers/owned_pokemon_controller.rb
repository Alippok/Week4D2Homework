require_relative('../models/pokemon.rb')
require_relative('../models/trainer.rb')
require_relative('../models/owned_pokemon.rb')
require('pry-byebug')


get '/owned_pokemon/new' do
  @pokemons = Pokemon.all
  @trainers = Trainer.all

  erb(:"owned_pokemon/new")
end


post '/owned_pokemon' do
  @owned_pokemon = OwnedPokemon.new( params )

  @owned_pokemon.save()
  redirect to '/'
end

get '/owned_pokemon' do 
  @owned_pokemons = OwnedPokemon.join1
  # pry.byebug
  
  erb(:"owned_pokemon/index")
end


