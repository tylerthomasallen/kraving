# https://github.com/appacademy/curriculum/tree/master/ruby/projects/ghost


class Ghost
  attr_accessor :fragment, :player1, :player2, :dictionary, :current_player, :previous_player

  def initialize(player1 = "Stephen", player2 = "Sam")
    @fragment = 'abac'
    @dictionary = create_dictionary
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @current_player = @player1
    @previous_player = nil
  end

  def create_dictionary
    dictionary = Hash.new()
    File.open('dictionary.txt').each_line do |word|
      dictionary[word.strip] = true
    end
    dictionary
  end

  def next_player!
    @previous_player = @current_player
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def take_turn(player) #@player1
    letter = player.get_letter



  end

  def valid_play?(letter_inputted)
    alphabet = ("a".."z").to_a
    return false unless alphabet.include?(letter_inputted)

  end

  def valid_word?
    @dictionary.keys.include?(@fragment)

  end

end



class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def get_letter
    puts "PUT LETTER HERE"
    gets.chomp
  end


end
