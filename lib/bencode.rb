class Bencode
  def self.parse(input, current_result=nil)
    # could be refactored into a single extraction method later
    i_indices = input.chars.each_with_index.collect {|val, index| index if val == "i"}.compact
    l_indices = input.chars.each_with_index.collect {|val, index| index if val == "l"}.compact
    end_indices = input.chars.each_with_index.collect {|val, index| index if val == "e"}.compact
    start_indices = i_indices + l_indices

    if input[0] == "i"
      return input[1...input.length].to_i
    else
      result = []
    end

    start_indices.each do |index|
      if input[index] == "i"
        end_index = get_end_index(index, start_indices, end_indices, is_int=true)
        result << parse(input[index..end_index])
      end
    end

    return result
  end

  def self.get_end_index(current_index, start_indices, end_indices, is_int=false)
    if !is_int
      end_indices[-start_indices[current_index]]
    else
      end_indices.sort!.select{|i| i > current_index}.first
    end
  end
end
