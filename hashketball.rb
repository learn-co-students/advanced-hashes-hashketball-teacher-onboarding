require "pry"

# Write your code here!
def game_hash
  game_hash = {
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
          rebounds: 11,
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
        "Bismack Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
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
        "Kemba Walker" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#     team_data.each do |attribute, data|
#       #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#       binding.pry
 
#       #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
#       data.each do |data_item|
#           binding.pry
#       end
#     end
#   end
# end

# good_practices

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        if data.keys.include?(player_name)
          return data[player_name][:points]
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        if data.keys.include?(player_name)
          return data[player_name][:shoe]
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name && team_data[:team_name] == team_name
        return team_data[:colors]
      end
    end
  end
end

def team_names
  team_name_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_name_array.push(team_data[:team_name])
      end
    end
  end
  return team_name_array
end

def player_numbers(team_name)
  player_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do | player |
        # binding.pry
        player_numbers.push(player[1][:number])
      end
    end
  end
  return player_numbers
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        if data.keys.include?(player_name)
          return data[player_name]
        end
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe_player = ""
  big_shoe_size = 0
  big_shoe_rebounds = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |stats|
          if stats[1][:shoe] > big_shoe_size
            big_shoe_size = stats[1][:shoe]
            big_shoe_player = stats[0]
            big_shoe_rebounds = stats[1][:rebounds]
          end
        end
      end
    end
  end

  return big_shoe_rebounds
end

def most_points_scored
  most_points_player = ""
  most_points_scored = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |stats|
          if stats[1][:points] > most_points_scored
            most_points_scored = stats[1][:points]
            most_points_player = stats[0]
          end
        end
      end
    end
  end

  return most_points_player
end

def winning_team
  home_points = 0
  away_points = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |stats|
          if location.to_s == "home"
            home_points += stats[1][:points]
          else
            away_points += stats[1][:points]
          end
        end
      end
    end
  end

  if home_points > away_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name_player = ""
  longest_name_length = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |stats|
          if stats[0].length > longest_name_length
            longest_name_length = stats[0].length
            longest_name_player = stats[0]
          end
        end
      end
    end
  end

  return longest_name_player
end

def long_name_steals_a_ton?
  longest_name_player = ""
  longest_name_length = 0
  longest_name_steals = 0
  most_steals = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |stats|

          if stats[1][:steals] > most_steals
            most_steals = stats[1][:steals]
          end

          if stats[0].length > longest_name_length
            longest_name_length = stats[0].length
            longest_name_player = stats[0]
            longest_name_steals = stats[1][:steals]
          end

        end
      end
    end
  end

  return longest_name_steals == most_steals
end
