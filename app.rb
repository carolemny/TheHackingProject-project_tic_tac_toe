require "bundler"
Bundler.require #récupération des Gems indispensables

$:.unshift File.expand_path("./../lib", __FILE__) #tout ce qui est dans le dossier de lib est mis dans le PATH
require "app/board_case"
require "app/board"
require "app/game"
require "app/player"
require "views/show"

class Application
  def perform
    system "clear"
    puts

    # INTRODUCTION AU JEU, RÉCUPÉRATION DES PRÉNOMS, CRÉATION DES JOUEURS
    puts "xoxoxo" * 20
    puts
    puts (" " * 45 + "Bienvenue dans TIC TAC TOE").yellow
    puts
    puts "xoxoxo" * 20
    puts

    # CRÉATION DES JOUEURS
    puts "Commence par me dire quel est ton prénom ?"
    print "> "
    name1 = gets.chomp
    puts "C'est noté, contre qui souhaites-tu jouer ?"
    print "> "
    name2 = gets.chomp
    my_game = Game.new(name1, name2)
    system "clear"
    puts
    puts "Super, #{name1} joue les 'X', #{name2} joue les 'O'.\n\nQue la partie commence ! 🏁 "
    puts
    puts "-> Appuie sur une touche pour continuer.".cyan
    gets.chomp

    # LANCEMENT D'UNE PARTIE
    is_victory = false
    while is_victory == false && my_game.board.full? == false
      is_victory = my_game.turn
    end

    # FIN D'UNE PARTIE
    my_game.game_end
  end
end

Application.new.perform
