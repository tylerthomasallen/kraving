class Dictionary
  attr_reader :entries

  def initialize
    p @entries = {}
  end

  def keywords
    p @entries.keys.sort { | x , y | x <=> y}
  end

  def add(new_entries)
    if new_entries.is_a?(String)
      p @entries[new_entries] = nil
    else new_entries.is_a?(Hash)
      p @entries.merge!(new_entries)
    end
  end

  def include?(new_entries)
    p @entries.keys.include?(new_entries)
  end

  def find(fragment)
    p fragment
    @entries.select do |word , definition|
     p word.match(fragment)
    end
  end

  def printable
    entries = keywords.map do |keyword|
      %Q{[#{keyword}] "#{@entries[keyword]}"}
    end
    entries.join("\n")
  end

end
