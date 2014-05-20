class Date
  def self.foolpaljoe
    puts "barkbarkbark"
  end

  def self.new_from_select(date_param, date_model, date_string)
    date_array = %w(1 2 3).map do |e|
      date_param[date_model][date_string + "(#{e}i)"].to_i
    end
    return Date.new *date_array
  end
end
