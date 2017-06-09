# Write your code here!
require "pry"


def game_hash

 {
   home: {
     team_name: "Brooklyn Nets",
     colors: ["Black", "White"],
     players: {
       "Alan Anderson" => {
         number: 0,
         shoe: 16,
         points: 22,
         rebounds: 12,
         assists: 12,
         steals: 3,
         blocks: 1,
         slam_dunks: 1
       },
       "Reggie Evans" => {
         number: 30,
         shoe: 14,
         points: 12,
         rebounds: 12,
         assists: 12,
         steals: 12,
         blocks: 12,
         slam_dunks: 7
       },
       "Brook Lopez" => {
         number: 11,
         shoe: 17,
         points: 17,
         rebounds: 19,
         assists: 10,
         steals: 3,
         blocks: 1,
         slam_dunks: 15
       },
       "Mason Plumlee" => {
         number: 1,
         shoe: 19,
         points: 26,
         rebounds: 12,
         assists: 6,
         steals: 3,
         blocks: 8,
         slam_dunks: 5
       },
       "Jason Terry" => {
         number: 31,
         shoe: 15,
         points: 19,
         rebounds: 2,
         assists: 2,
         steals: 4,
         blocks: 11,
         slam_dunks: 1
       }
     }
   },
   away: {
     team_name: "Charlotte Hornets",
     colors: ["Turquoise", "Purple"],
     players: {
       "Jeff Adrien" => {
         number: 4,
         shoe: 18,
         points: 10,
         rebounds: 1,
         assists: 1,
         steals: 2,
         blocks: 7,
         slam_dunks: 2
       },
       "Bismak Biyombo" => {
         number: 0,
         shoe: 16,
         points: 12,
         rebounds: 4,
         assists: 7,
         steals: 7,
         blocks: 15,
         slam_dunks: 10
       },
       "DeSagna Diop" => {
         number: 2,
         shoe: 14,
         points: 24,
         rebounds: 12,
         assists: 12,
         steals: 4,
         blocks: 5,
         slam_dunks: 5
       },
       "Ben Gordon" => {
         number: 8,
         shoe: 15,
         points: 33,
         rebounds: 3,
         assists: 2,
         steals: 1,
         blocks: 1,
         slam_dunks: 0
       },
       "Brendan Haywood" => {
         number: 33,
         shoe: 15,
         points: 6,
         rebounds: 12,
         assists: 12,
         steals: 22,
         blocks: 5,
         slam_dunks: 12
       }
     }
   }
 }

end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    # binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        # binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            # binding.pry
      end
    end
  end
end

# good_practices

#use .each to get the location/team_data hashes
#use the team_data hash to access the players hash
# from the player hash, use .include? to find out if the player is in that team
#store that truthiness into a local variable
#use an if statement to access the player points with a traditional hash-chain

def num_points_scored(player_name)

 points = 0

  game_hash.each do |location, team_data|

    if team_data[:players].keys.include?(player_name)

      points = team_data[:players][player_name][:points]

    end

  end

  points

end

def shoe_size(player_name)

  shoe_size = 0

  game_hash.each do |location, team_data|

    if team_data[:players].keys.include?(player_name)

      shoe_size = team_data[:players][player_name][:shoe]

    end

  end

  shoe_size

end

def team_colors(team_name)

  team_colors = ""

  game_hash.each do |location, team_data|

    if team_data[:team_name] == team_name

      team_colors = team_data[:colors]

    end

  end

  team_colors

end

def team_names

  teams = []

  game_hash.each do |location, team_data|
    teams << team_data[:team_name]
  end
 teams
end

def player_numbers(team_name)

  numbers = []

  game_hash.each do |location, team_data|

    if team_data[:team_name] == team_name

      team_data[:players].each do |player_name, stats|

        numbers << stats[:number]

      end

    end

  end
  numbers
end

def player_stats(player_name)

  game_hash.each do |location, team_data|

    if team_data[:players].keys.include?(player_name)

      return team_data[:players][player_name]

    end

  end

end


def big_shoe_rebounds

  player_with_biggest_shoes = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if (player_with_biggest_shoes)
        if shoe_size(player_with_biggest_shoes) < player_stats[:shoe]

          player_with_biggest_shoes = player_name
        else

          player_with_biggest_shoes = player_with_biggest_shoes
        end
      else
        player_with_biggest_shoes = player_name
      end

    end

  end

  player_stats(player_with_biggest_shoes)[:rebounds]

end

def most_points_scored

  top_scorer = nil

  game_hash.each do |location, team_data|

    team_data[:players].each do |player_name, player_stats|

      if top_scorer
        if num_points_scored(top_scorer) < num_points_scored(player_name)
          top_scorer = player_name
        else
          top_scorer = top_scorer
        end
      else
        top_scorer = player_name
      end

    end

  end
  top_scorer
end

def winning_team

  home_team_score = 0
  away_team_score = 0

  game_hash.each do |location, team_data|

    if location == :home
      home_team_score = team_total_score(location)
    elsif location == :away
      away_team_score = team_total_score(location)
    end

  end

  if home_team_score > away_team_score
    game_hash[:home][:team_name]
  elsif away_team_score > home_team_score
    game_hash[:away][:team_name]
  end

end

def team_total_score(team_location)

  score = 0

  game_hash[team_location][:players].each do |player_name, player_stats|

    score += player_stats[:points]

  end

  score

end

def player_with_longest_name

    if longest_name_on_team(game_hash[:home]).length > longest_name_on_team(game_hash[:away]).length
      longest_name_on_team(game_hash[:home])
    else
      longest_name_on_team(game_hash[:away])
    end
end

def longest_name_on_team(location)
# binding.pry
  longest_name = location[:players].keys.sort do |player_name_a, player_name_b|

      player_name_b.length <=> player_name_a.length

    end

  longest_name[0]

end

# player_with_longest_name

def long_name_steals_a_ton



end
