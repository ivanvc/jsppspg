def round_robin(teams = [])
  matches = []

  teams.each do |team|

    oposing_teams = teams
    teams.delete team

    for oposing_team in oposing_teams
      match    = "#{team} vs #{oposing_team}"
      matches << match unless matches.include? match || matches.inlcude?("#{oposing_team} vs #{team}")
    end

  end

  matches.shuffle
end

puts round_robin(ARGV)

