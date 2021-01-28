class Game
  attr_accessor :current_player, :status, :board, :players_array #la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.

  def initialize(name1, name2)
    #créé 2 joueurs
    @players_array = Array.new
    @players_array << Player.new(name1, "X")
    @players_array << Player.new(name2, "O")
    @board = Board.new
    @current_player = @players_array[0]
  end

  def turn #méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    @status
    Show.new.show_board(@board) #affiche le plateau
    @board.play_turn(@current_player)
    is_victory = @board.victory?
    if is_victory == false
      #changement de joueur
      if @current_player == @players_array[0]
        @current_player = @players_array[1]
      else
        @current_player = @players_array[0]
      end
    end
    return is_victory
  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  end

  def game_end #permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
    Show.new.show_board(@board)
    puts
    if board.full? && board.victory? == false
      puts "Partie terminée, vous êtes nuls tous les deux!".red
    else
      puts "La partie est finie. BRAVO #{current_player.name} : tu as gagné !".green
    end
  end
end
