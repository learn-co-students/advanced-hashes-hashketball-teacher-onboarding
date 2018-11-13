require 'pry'

def game_hash
  home_players = {
    "Alan Anderson" => {
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
    },
    "Reggie Evans" => {
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
    },
    "Brook Lopez" => {
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
    },
    "Mason Plumlee" => {
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
    },
    "Jason Terry" => {
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
    }
  }

  away_players = {
    "Jeff Adrien" => {
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
    },
    "Bismak Biyombo" => {
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
    },
    "DeSagna Diop" => {
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
    },
    "Ben Gordon" => {
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
    },
    "Brendan Haywood" => {
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
    }
  }

  new_game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => home_players
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => away_players
    }
  }

  return new_game
end

def num_points_scored (name)
  # if game_hash[:home][:players].has_key?(name)
  #   return game_hash[:home][:players][name][:points]
  # elsif game_hash[:away][:players].has_key?(name)
  #   return game_hash[:away][:players][name][:points]
  # end
  player = find_player(name)
  player.fetch(:points)
end

def shoe_size (name)
    # if game_hash[:home][:players].has_key?(name)
      # return game_hash[:home][:players][name][:shoe]
    # elsif game_hash[:away][:players].has_key?(name)
      # return game_hash[:away][:players][name][:shoe]
    # end
  player = find_player(name)
  player.fetch(:shoe)
end

def team_colors(name)
  team = find_team(name)
  team.fetch(:colors)
end

def team_names
  teams = []
  game_hash.each do |side, team|
    name = team.fetch(:team_name)
    teams.push(name)
  end
  teams
end

def player_numbers(team_name)
  team = find_team(team_name)
  team[:players].map {|player, statistics| statistics[:number]}
end

def player_stats(name)
  find_player(name)
end

def big_shoe_rebounds
  name = players.max_by{|player, statistics| statistics[:shoe]}[0]
  biggest_shoe = find_player(name).fetch(:rebounds)
end

def most_points_scored
  players.max_by{|player, statistics| statistics[:points]}[0]
end

def winning_team
  home_score = game_hash[:home][:players].map {|player, statistics| statistics[:points]}.reduce(:+)
  away_score = game_hash[:away][:players].map {|player, statistics| statistics[:points]}.reduce(:+)
  if home_score > away_score
    return game_hash[:home][:team_name]
  elsif away_score < home_score
    return game_hash[:away][:team_name]
  else
    return "Draw"
  end
end

def player_with_longest_name
  players.max_by{|player, statistics| player.length}[0]

  #longest_name = ""
  # players.each do |player, statistics|
  #   if player.length > longest_name.length
  #     longest_name = player
  #   end
  # end
  # longest_name
end

def long_name_steals_a_ton?
  long_name = player_with_longest_name
  if long_name == players.max_by{|player, statistics| statistics[:steals]}[0]
    binding.pry
    return true
  else
    return false
  end
end

def find_player (name)
  players.fetch(name)
end

def players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def find_team(name)
  game_hash.each do |side, team|
    if team[:team_name] == name
      return team
    end
  end
end
