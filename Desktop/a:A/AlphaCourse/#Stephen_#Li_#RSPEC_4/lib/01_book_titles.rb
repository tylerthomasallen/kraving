class Book
  attr_reader :title

  SMALL_WORDS = ["the", "a" , "and" , "an" , "of" , "in"]

  def title=(title)
    title_words = title.split(" ").map(&:downcase)

    new_words = title_words.map.with_index do |word , idx|
      if idx != 0 && SMALL_WORDS.include?(word)
        word
      else
        word.capitalize
      end
    end
    @title = new_words.join(" ")
  end



end
