class TheSwitch
  def horrible_switch_statement(code)
    case code
    when 0
      method_hop_0
    when 1
      method_hop_1
    when 2
      method_hop_2
    when 3
      method_hop_3
    else
      "wrong code"
    end
  end

  def method_hop_0
    "Awesome"
  end

  def method_hop_1
    "not so awesome"
  end

  def method_hop_2
    "getting really icky"
  end

  def method_hop_3
    "this is not going anywhere"
  end

  #Dangerous
  def meta_programming_solution(code)
    self.send("method_hop_#{code}")
  end

  POSSIBLE_CODES = [0,1,2,3].freeze

  def meta_programming_solution_2(code)
    POSSIBLE_CODES.include?(code) ? self.send("method_hop_#{code}") : "wrong code"
  end

  def meta_programming_solution_3(code)
    begin
      self.send("method_hop_#{code}")
    rescue NoMethodError
      "wrong code"
    end
  end
end
