def game_hash
  return {
           :home => {
             :team_name => "Brooklyn Nets",
             :colors => %w{Black White},
             :players => [
               {
                 :player_name => "Alan Anderson",
                 :number => 0,
                 :shoe => 16,
                 :points => 22,
                 :rebounds => 12,
                 :assists => 12,
                 :steals => 3,
                 :blocks => 1,
                 :slam_dunks => 1,
               },
               {
                 :player_name => "Reggie Evans",
                 :number => 30,
                 :shoe => 14,
                 :points => 12,
                 :rebounds => 12,
                 :assists => 12,
                 :steals => 12,
                 :blocks => 12,
                 :slam_dunks => 7,
               },
               {
                 :player_name => "Brook Lopez",
                 :number => 11,
                 :shoe => 17,
                 :points => 17,
                 :rebounds => 19,
                 :assists => 10,
                 :steals => 3,
                 :blocks => 1,
                 :slam_dunks => 15,
               },
               {
                 :player_name => "Mason Plumlee",
                 :number => 1,
                 :shoe => 19,
                 :points => 26,
                 :rebounds => 11,
                 :assists => 6,
                 :steals => 3,
                 :blocks => 8,
                 :slam_dunks => 5,
               },
               {
                 :player_name => "Jason Terry",
                 :number => 31,
                 :shoe => 15,
                 :points => 19,
                 :rebounds => 2,
                 :assists => 2,
                 :steals => 4,
                 :blocks => 11,
                 :slam_dunks => 1,
               },
             ],
           },
           :away => {
             :team_name => "Charlotte Hornets",
             :colors => %w{Turquoise Purple},
             :players => [
               {
                 :player_name => "Jeff Adrien",
                 :number => 4,
                 :shoe => 18,
                 :points => 10,
                 :rebounds => 1,
                 :assists => 1,
                 :steals => 2,
                 :blocks => 7,
                 :slam_dunks => 2,
               },
               {
                 :player_name => "Bismack Biyombo",
                 :number => 0,
                 :shoe => 16,
                 :points => 12,
                 :rebounds => 4,
                 :assists => 7,
                 :steals => 22,
                 :blocks => 15,
                 :slam_dunks => 10,
               },
               {
                 :player_name => "DeSagna Diop",
                 :number => 2,
                 :shoe => 14,
                 :points => 24,
                 :rebounds => 12,
                 :assists => 12,
                 :steals => 4,
                 :blocks => 5,
                 :slam_dunks => 5,
               },
               {
                 :player_name => "Ben Gordon",
                 :number => 8,
                 :shoe => 15,
                 :points => 33,
                 :rebounds => 3,
                 :assists => 2,
                 :steals => 1,
                 :blocks => 1,
                 :slam_dunks => 0,
               },
               {
                 :player_name => "Kemba Walker",
                 :number => 33,
                 :shoe => 15,
                 :points => 6,
                 :rebounds => 12,
                 :assists => 12,
                 :steals => 7,
                 :blocks => 5,
                 :slam_dunks => 12,
               },
             ],
           },
         }
end

def num_points_scored(name)
  game_hash[:home][:players].concat(game_hash[:away][:players]).find { |player| player[:player_name] == name }[:points]
end

def shoe_size(name)
  game_hash[:home][:players].concat(game_hash[:away][:players]).find { |player| player[:player_name] == name }[:shoe]
end

def team_colors(team)
  game_hash.values.find { |e| e[:team_name] == team }[:colors]
end

def team_names
  game_hash.values.map { |e| e[:team_name] }
end

def player_numbers(team)
  game_hash.values.find { |e| e[:team_name] == team }[:players].map { |p| p[:number] }
end

def player_stats(name)
  stats = game_hash[:home][:players].concat(game_hash[:away][:players]).find { |player| player[:player_name] == name }
  stats.delete(:player_name)
  stats
end

def big_shoe_rebounds
  game_hash[:home][:players].concat(game_hash[:away][:players]).reduce({ :shoe => 0 }) { |a, c| (c[:shoe] > a[:shoe]) ? c : a }[:rebounds]
end

def most_points_scored
  game_hash[:home][:players].concat(game_hash[:away][:players]).reduce({ :points => 0 }) { |a, c| (c[:points] > a[:points]) ? c : a }[:player_name]
end

def winning_team
  homeScore = game_hash[:home][:players].reduce(0) { |a, c| a + c[:points] }
  awayScore = game_hash[:away][:players].reduce(0) { |a, c| a + c[:points] }
  homeScore > awayScore ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  game_hash[:home][:players].concat(game_hash[:away][:players]).reduce({ :player_name => "" }) { |a, c| (c[:player_name].length > a[:player_name].length) ? c : a }[:player_name]
end

def long_name_steals_a_ton?
  steals = game_hash[:home][:players].concat(game_hash[:away][:players]).reduce({ :player_name => "" }) { |a, c| (c[:player_name].length > a[:player_name].length) ? c : a }[:steals]
  maxSteals = game_hash[:home][:players].concat(game_hash[:away][:players]).reduce({ :steals => 0 }) { |a, c| (c[:steals] > a[:steals]) ? c : a }[:steals]
  steals >= maxSteals
end

# these should clearly be broken into helper methods, but.
