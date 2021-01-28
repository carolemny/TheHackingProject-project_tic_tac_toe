class BoardCase
  attr_accessor :value, :case_name #la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case

  def initialize(name) #doit régler sa valeur, ainsi que son nom
    @value = " "
    @case_name = name
  end
end
