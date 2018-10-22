class Card #< Integer
  attr_accessor :face_up, :value
  def initialize
    @value = rand(100)
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def ==(compare)
    @value == compare
  end

  def display
    if @face_up
      @value
    else
      "_"
    end
  end
  #
  # def hide
  #   @face_up = false
  # end
  #
  # def to_s
  #   @value.to_s
  # end
  #
end
