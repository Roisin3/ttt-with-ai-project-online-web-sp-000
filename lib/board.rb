class Board
  attr_accessor :cells


  def initialize()
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

  def full?
    cells.all? do |blank|
      blank == "X" || blank == "O"
    end
  end

  def turn_count
    turn_number = 0
    cells.each do |token|
      if token == "X" || token == "O"
        turn_number += 1
      end
    end
    turn_number
  end

  def taken?(input)
    !(position(input) == "" || position(input) == " ")
  end

  def valid_move?(index)
    if index.to_i.between?(1, 9) && !taken?(index)
      true
    end
  end
end
