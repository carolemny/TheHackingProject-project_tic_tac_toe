class Board
  #la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  attr_accessor :board_cases_array
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué

  def initialize
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe

    @board_cases_array = Array.new #création de 9 board_case de 0 à 8
    board_cases_array_names = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    board_cases_array_names.each do |name|
      @board_cases_array << BoardCase.new(name)
    end
  end

  def play_turn(current_player)
    board_case_to_change = nil
    while board_case_to_change == nil
      #1) demande au bon joueur ce qu'il souhaite faire
      puts
      puts "#{current_player.name}, quelle case choisis-tu ?"
      print "> "
      choice = gets.chomp
      #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
      board_case_to_change = @board_cases_array.find { |board_case| board_case.case_name == choice.upcase && board_case.value == " " } #retrouve le bordcase choisi
    end
    board_case_to_change.value = current_player.symbol #pour changer la value du boardcase choisi
  end

  def victory?
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
    if (@board_cases_array[0].value == @board_cases_array[1].value && @board_cases_array[0].value == @board_cases_array[2].value && @board_cases_array[0].value != " ") || (@board_cases_array[3].value == @board_cases_array[4].value && @board_cases_array[3].value == @board_cases_array[5].value && @board_cases_array[3].value != " ") || (@board_cases_array[6].value == @board_cases_array[7].value && @board_cases_array[6].value == @board_cases_array[8].value && @board_cases_array[6].value != " ") || (@board_cases_array[0].value == @board_cases_array[3].value && @board_cases_array[0].value == @board_cases_array[6].value && @board_cases_array[0].value != " ") || (@board_cases_array[1].value == @board_cases_array[4].value && @board_cases_array[1].value == @board_cases_array[7].value && @board_cases_array[1].value != " ") || (@board_cases_array[2].value == @board_cases_array[5].value && @board_cases_array[2].value == @board_cases_array[8].value && @board_cases_array[2].value != " ") || (@board_cases_array[0].value == @board_cases_array[4].value && @board_cases_array[0].value == @board_cases_array[8].value && @board_cases_array[0].value != " ") || (@board_cases_array[2].value == @board_cases_array[4].value && @board_cases_array[2].value == @board_cases_array[6].value && @board_cases_array[2].value != " ")
      return true
    else
      return false
    end
  end

  def full?
    return @board_cases_array.find { |board_case| board_case.value == " " } == nil
  end
end
