
class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @board = []
  end

  def setup
    secret_word_length = @referee.pick_secret_word
    @guesser.register_secret_length(secret_word_length)
    @board = Array.new(secret_word_length)
  end

  def take_turn
    guesser_guess = @guesser.guess
    @referee.check_guess(guesser_guess)
    update_board
    @guesser.handle_response
  end

  def update_board
    @board
  end

end



class ComputerPlayer
  attr_reader :dictionary, :candidate_words

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word.length
  end

  def check_guess(letter_guessed)
    raise "error" if letter_guessed.class != String || letter_guessed.length != 1
    indices = []
    @secret_word.chars.each_with_index do |le , i|
      indices << i if le == letter_guessed
    end
    indices
  end

  def register_secret_length(secretlength)
    @candidate_words = @dictionary.select {|word| word.length == secretlength}
  end

  def guess(board)
    alphabet = @candidate_words.join.split("")
    letter_count = Hash.new(0)
    alphabet.each do |le|
      next if board.include?(le)
      letter_count[le] += 1
    end
    highest_count = letter_count.values.max
    most_letter = []
    letter_count.each do |k , v|
      most_letter << k if letter_count[k] == highest_count
    end
    most_letter.sample

  end

  def handle_response(letter, indicies)
    @candidate_words.select! do |word|
      valid = true
      indicies.each do |i|
        valid = false unless word[i] == letter
      end
      valid = false unless indicies.length == word.count(letter)
      valid
    end
  end


end



#
#
# class Hangman
#   attr_reader :guesser, :referee, :board
#
#   def initialize(players)
#     @guesser = players[:guesser]
#     @referee = players[:referee]
#     @board = []
#   end
#
#   def setup
#     length = @referee.pick_secret_word
#     @guesser.register_secret_length(length)
#     @board = Array.new(length)
#   end
#
#   def take_turn
#     letter_guessed = @guesser.guess
#     occurrences = @referee.check_guess(letter_guessed)
#     update_board(letter_guessed, occurrences)
#     @guesser.handle_response
#   end
#
#   def update_board(letter_guessed, occurrences)
#     occurrences.each do |i|
#       @board[i] = letter_guessed
#     end
#   end
#
#
# end
#
# class HumanPlayer
# end
#
# class ComputerPlayer
#   attr_reader :dictionary, :candidate_words
#
#   def initialize(dictionary)
#     @dictionary = dictionary
#   end
#
#   def pick_secret_word
#     @secret_word = @dictionary.sample
#     secret_word_length = @secret_word.length
#   end
#
#   def check_guess(letter)
#     raise "input a letter" if letter.class != String || letter.length != 1
#     index = []
#     @secret_word.chars.each_with_index do |char, idx|
#       index << idx if char == letter
#     end
#     index #array with idx of secret word that matches letter
#   end
#
#   def register_secret_length(secret_length)
#     @candidate_words = @dictionary.select { |word| word.length == secret_length}
#   end
#
#   def guess(board)
#     alphabet = @candidate_words.join.split("")#array
#     available_letters = Hash.new(0)
#     alphabet.each do |letter|
#       next if board.include?(letter)
#       available_letters[letter] += 1
#     end
#
#     max_count = available_letters.values.max
#     most_letter = []
#     available_letters.each_key do |key|
#       if available_letters[key] == max_count
#         most_letter << key
#       end
#     end
#     most_letter.sample
#   end
#
#   def handle_response(letter, indices)
#     @candidate_words.select! do |word|
#       valid = true
#       indices.each do |i|
#         valid = false if word[i] != letter
#       end
#       valid = false unless word.count(letter) == indices.length
#       valid
#     end
#     p @candidate_words
#   end
#
#
# end
