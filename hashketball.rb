# Write your code here!










# Write your code here!

def game_hash 
    {
      :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => {
          "Alan Anderson" => {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1,
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
      },
  
      :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => {
          "Jeff Adrien" => {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2,
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
      }
    }
  end
  
  def num_points_scored(player)
    game_hash.each do |home_away, team|
      team[:players].each do |name, stats|
        if name == player
          return stats[:points]
        end
      end
    end
  end
  
  def shoe_size(player)
    game_hash.each do |home_away, team|
      if team[:players][player] 
        return team[:players][player][:shoe]
      end
    end
  end
  
  def team_colors(team)
    game_hash.each do |home_away, squad|
      if squad[:team_name] == team
        return squad[:colors]
      end
    end
  end
  
  def team_names
    all_teams = []
    game_hash.each do |home_away, teams|
      all_teams << teams[:team_name]
    end
    return all_teams
  end
  
  def player_numbers(team) 
    all_numbers = []
    game_hash.each do |home_away, teams|
      if teams[:team_name] == team
        teams[:players].each do |single_player, num|
          all_numbers << num[:number]
        end
      end
    end
    return all_numbers
  end
  
  def player_stats(single_player)
    game_hash.each do |home_away, teams|
      if teams[:players][single_player]
        return teams[:players][single_player]
      end
    end
  end
  
  def big_shoe_rebounds
    biggest_shoe_so_far = 0
    biggest_shoe_rebs = 0
    game_hash.each do |home_away, team|
      team[:players].each do |name, stat|
        if stat[:shoe] > biggest_shoe_so_far
          biggest_shoe_so_far = stat[:shoe]
          biggest_shoe_rebs = stat[:rebounds]
        end
      end
    end
    return biggest_shoe_rebs
  end