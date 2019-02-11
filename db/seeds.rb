# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Initial population of tables

Pokemon.destroy_all
Generation.destroy_all
ElementType.destroy_all

# creating the types table
puts "Populating Element Types table."
types_responses = HTTParty.get("https://pokeapi.co/api/v2/type/")
types_data = JSON.parse(types_responses.body)

types_data['results'].each do |type|
    type_response = HTTParty.get(type['url'])
    type_data = JSON.parse(type_response.body)
    element_type = ElementType.create(:typeName => type_data['name'])
end

puts "Populating Element Types table complete."

sleep 30
# creating the generations table

puts "Populating Generations table."
generation_response = HTTParty.get("https://pokeapi.co/api/v2/generation/")
generation_data = JSON.parse(generation_response.body)
generation_data['results'].each do |generation|
    generation_info = Generation.create(:generation => generation['name'])
end

puts "Populating Generations table complete."

sleep 30

# creating the Pokemon table
# change the offset depending on batch runs due to hitting a limit.
offset = 0
limit = 20

puts "Populating Pokemon table."
2.times do
    pokemon_responses = HTTParty.get("https://pokeapi.co/api/v2/pokemon/?" + "offset=#{offset}" + "&limit=#{limit}")
    pokemon_type_data = JSON.parse(pokemon_responses.body)

    pokemon_type_data['results'].each do |index|
        pokemon_details_responses = HTTParty.get(index['url'])
        result = JSON.parse(pokemon_details_responses.body)

        species_responses = HTTParty.get(result['species']['url'])
        species_data = JSON.parse(species_responses.body)

        pokemon_generation = Generation.where(:generation => species_data['generation']['name']).take
        pokemon = pokemon_generation.pokemons.new(:name => result['species']['name'],
                                          :imageURL => result['sprites']['front_default'])

        result['types'].each do |type|
            if type['slot'] == 2 then
                pokemon.secondaryType = type['type']['name']
            else
                element_type = ElementType.where(:typeName => type['type']['name']).take
                pokemon.element_type_id = element_type.id
            end
        end

        species_data['pokedex_numbers'].each do |official|
            if official['pokedex']['name'] == "national"
                pokemon.pokdexID = official['entry_number']
            end
        end

        species_data['flavor_text_entries'].each do |flavor|
            if flavor['language']['name'] == "en"
                pokemon.pokedexDescription = flavor['flavor_text']
                break
            end
        end

        evolution_responses = HTTParty.get(species_data['evolution_chain']['url'])
        evolution_data = JSON.parse(evolution_responses.body)
        evolution_chain_data = evolution_data['chain']
        pokemon.evolveFrom = "--"
        pokemon.evolveTo = '--'
        because_eevee_is_annoying = ''

        if evolution_chain_data['evolves_to'].length > 0
            if pokemon.name == "eevee"
                evolution_chain_data['evolves_to'].each do |eeveelution|
                    because_eevee_is_annoying += because_eevee_is_annoying == ''? eeveelution['species']['name'] : ', ' + eeveelution['species']['name']
                end
                pokemon.evolveTo = because_eevee_is_annoying
            elsif evolution_chain_data['species']['name'] == "eevee"
                pokemon.evolveFrom = "eevee"
            elsif evolution_chain_data['species']['name'] == pokemon.name
                pokemon.evolveTo = evolution_chain_data['evolves_to'][0]['species']['name']
            elsif evolution_chain_data['evolves_to'][0]['evolves_to'].length > 0
                if evolution_chain_data['evolves_to'][0]['species']['name'] == pokemon.name
                    pokemon.evolveTo = evolution_chain_data['evolves_to'][0]['evolves_to'][0]['species']['name']
                    pokemon.evolveFrom = evolution_chain_data['species']['name']
                elsif evolution_chain_data['evolves_to'][0]['evolves_to'][0]['species']['name'] == pokemon.name
                    pokemon.evolveFrom = evolution_chain_data['evolves_to'][0]['species']['name']
                end
            end
        end

        pokemon.save
        pp pokemon

    end

    sleep 120
    offset += limit

    puts Pokemon.count
end
puts "Populating Pokemon table complete."

puts 'Seeding Complete'