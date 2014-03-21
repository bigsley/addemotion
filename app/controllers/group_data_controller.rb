class GroupDataController < ApplicationController
  respond_to :json

  def show
    users = User.find(:all)
    
    # today's memories
    beginning_of_day = DateTime.now.beginning_of_day
    memories = users.map {|x| x.memories.where("created_at > ?", DateTime.now.beginning_of_day).last}.compact

    numberActiveToday = memories.count / 2

    moods = users.map {|x| x.moodToday}
    stresses = users.map {|x| x.stressToday}

    render json: {
      numberUsers: users.count,
      activeToday: memories.count,
      numberHappy: moods.count {|x| x == "happy"},
      numberSad: moods.count {|x| x == "sad"},
      numberStressed: stresses.count {|x| x == "stressed"},
      numberChill: stresses.count {|x| x == "chill"}
    }
  end
end
