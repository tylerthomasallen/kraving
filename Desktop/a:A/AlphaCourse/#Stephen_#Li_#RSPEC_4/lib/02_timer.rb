class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end

  def padded(num)
    if num < 10
      "0#{num}"
    else
      "#{num}"
    end
  end

  def hours
    Integer(seconds / 3600)
  end

  def minutes
    Integer((seconds % 3600) / 60)
  end

  def minutes_seconds
    Integer((seconds % 60))
  end

  def time_string
    "#{padded(hours)}:#{padded(minutes)}:#{padded(minutes_seconds)}"
  end
end
