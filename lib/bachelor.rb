def get_first_name_of_season_winner(data, season)
  winner_name = ""
  data.each do |season_no, contestant_info|
    if season_no == season
      contestant_info.each do |i|
        if i["status"] == "Winner"
          winner_name = i["name"].split
        end
      end
    end
  end
  winner_name[0]
end

def get_contestant_name(data, occupation)
  con_name = ""
  data.map do |season, details|
    details.each do |i|
      if i["occupation"] == occupation
        con_name = i["name"]
      end
    end
  end
  con_name
end

def count_contestants_by_hometown(data, hometown)
  i = 0
  data.each do |season, details|
    details.each do |n|
      if n["hometown"] == hometown
        i += 1
      end
    end
  end
  i
end

def get_occupation (data, hometown)
  holder = ""
  data.find do |season_no, season_info|
    holder = season_info.find { |i| i["hometown"] == hometown }
  end
  holder["occupation"]
end

def get_average_age_for_season (data, season)
  age_array = []
  total_sum = ""
  data.each do |season_no, season_info|
    if season_no == season
      season_info.each do |i|
        age_array << (i["age"]).to_i
      end
    end
  end
  total_sum = age_array.inject(0) { |sum, i| sum + i }
  (total_sum.to_f/age_array.length).to_f.round
end
