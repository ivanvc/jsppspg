#!/usr/bin/env ruby
def calculate_score(ordered_goals=[])
  team_a_score = 0
  team_b_score = 0

  fibonacci_length     = ordered_goals.size
  fibonacci_index      = 1
  fibonacci_index_prev = 0
  (0...fibonacci_length).each do |num|
    fibonacci = fibonacci_index + fibonacci_index_prev
    if ordered_goals[num] == '0'
      team_a_score += fibonacci
    else
      team_b_score += fibonacci
    end
    fibonacci_index_prev = fibonacci_index unless num == 0
    fibonacci_index = fibonacci
  end

  ["Team A: #{team_a_score}", "Team B: #{team_b_score}", team_a_score > team_b_score ? "Team A le desgarro el ano a Team B" : "Team B le desgarro el ano a Team A"]

end

puts calculate_score(ARGV)

