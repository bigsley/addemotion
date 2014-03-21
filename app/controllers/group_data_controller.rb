class GroupDataController < ApplicationController
  respond_to :json

  def show
    users = User.find(:all)
    
    # today's memories
    beginning_of_day = DateTime.now.beginning_of_day
    all_memories = users.map {|x| x.memories.where("created_at > ?", DateTime.now.beginning_of_day)}.flatten
    memories = users.map {|x| x.memories.where("created_at > ?", DateTime.now.beginning_of_day).last}.compact

    moods = users.map {|x| x.mood_today}
    stresses = users.map {|x| x.stress_today}

    explanations = all_memories.find_all do |memory|
      memory.explanation && !memory.explanation.strip.empty?
    end.shuffle.first(10).compact.map {|x| x.explanation}

    render json: {
      numberUsers: users.count,
      activeToday: memories.count,
      numberHappy: moods.count {|x| x == "happy"},
      numberSad: moods.count {|x| x == "sad"},
      numberStressed: stresses.count {|x| x == "stressed"},
      numberChill: stresses.count {|x| x == "chill"},
      explanations: explanations
    }
  end
end
