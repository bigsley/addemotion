class GroupDataController < ApplicationController
  respond_to :json

  def show
    users = User.find(:all)
    
    # today's memories
    beginning_of_day = DateTime.now.beginning_of_day
    memories = users.map {|x| x.memories.where("created_at > ?", beginning_of_day).last}.compact
    numberActiveToday = memories.count / 2

    render json: {
      numberUsers: users.count,
      activeToday: memories.count,
      numberHappy: memories.count {|x| x.mood == "happy"},
      numberSad: memories.count {|x| x.mood == "sad"},
      numberStressed: memories.count {|x| x.stress == "stressed"},
      numberChill: memories.count {|x| x.stress == "chill"}
    }
  end
end
