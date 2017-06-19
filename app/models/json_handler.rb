require 'json'

class JSON_Handler
  def self.make_json
    #take all players and hashify them
    players_hash = Player.all.each_with_object({}) do |one_player, temp_hash|
      temp_hash[one_player.name]= {}
      temp_hash[one_player.name][:name]= one_player.name
      temp_hash[one_player.name][:wins]= one_player.wins
      temp_hash[one_player.name][:losses]= one_player.losses
    end
    #convert players_hash to json
    json = players_hash.to_json

    #Delete existing json file if one exists
    if File.exist?("players_info.json")
      File.delete("players_info.json")
    end

    #Make a json file with all player data in it
    players_file = File.new("players_info.json", "w+")
    players_file.write(json)
    players_file.close
  end

  def self.wipe_all_players
    if File.exist?("players_info.json")
      File.delete("players_info.json")
    end
  end

  def self.all
    @@all
  end

  def self.read_existing_players
    #read player data if it exists
    if File.exist?("players_info.json")
      raw_json_data = File.read('players_info.json')
      player_data_hash = JSON.parse(raw_json_data)

      player_data_hash.keys.each do |player_name|
        wins = player_data_hash[player_name]["wins"]
        losses = player_data_hash[player_name]["losses"]
        Player.new(player_name, wins, losses)
      end
    end
  end

end
