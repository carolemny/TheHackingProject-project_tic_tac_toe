class Show 
  def show_board(board_instance)
    #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
    puts " #{show_case(board_instance.board_cases_array[0])} | #{show_case(board_instance.board_cases_array[1])} | #{show_case(board_instance.board_cases_array[2])} "
    puts "-----------"
    puts " #{show_case(board_instance.board_cases_array[3])} | #{show_case(board_instance.board_cases_array[4])} | #{show_case(board_instance.board_cases_array[5])} "
    puts "-----------"
    puts " #{show_case(board_instance.board_cases_array[6])} | #{show_case(board_instance.board_cases_array[7])} | #{show_case(board_instance.board_cases_array[8])} "
  end

  def show_case(board_case)
    if board_case.value == " "
      return board_case.case_name
    else
      return board_case.value
    end
  end
end
