# frozen_string_literal: true

# class CLI
class Cli
  def main_menu
    # Add a title? PokeFight!
    puts 'What would you like to do?'
    puts " 1.) New Game\n 2.) Exit"
    player_choice = gets.chomp.downcase
    if player_choice == 'new game' || player_choice == '1'
      start
    elsif player_choice == 'exit' || player_choice == '2'
      exit
    else
      puts 'That was an invalid choice! Please choose again.'
      main_menu
    end
  end

  def start
    puts 'Which pokemon do you prefer?'
    puts " 1.) Abra\n 2.) Pikachu"
    poke_choice = gets.chomp.downcase
    # Use include? enumerable to check if it actually exists in the api
    if poke_choice == 'abra' || poke_choice =='pikachu'
      player = PokeApi.get(pokemon: "#{poke_choice}").name
      location
    else
      puts 'Not a valid choice'
      start
    end
  end

  def location
    puts 'Which location would you like to challenge?'
    puts " - Volcano\n - Pond"
    location_choice = gets.chomp.downcase
    if location_choice == 'volcano'
      puts 'hot!'
      volcano_battle
    elsif location_choice == 'pond'
      puts 'wet!'
      pond_battle
    else
      puts 'Not a valid location! Choose again.'
      location
    end
  end

  # battle methods! per location and a general battle method containing a while loop for HP > 0.
  def battle
    
  end
end
