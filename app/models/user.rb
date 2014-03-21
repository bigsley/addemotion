class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email, :on => :create
  has_many :memories

  def memories_today
    return @memories_today if @memories_today
    @memories_today = self.memories.where("created_at > ?", DateTime.now.beginning_of_day).all
  end

  def mood_today
    return "none" if memories_today.empty?
    happy_today = memories_today.count {|x| x.mood == "happy"}
    sad_today = memories_today.count {|x| x.mood == "sad"}

    happy_today >= sad_today ? "happy" : "sad"
  end

  def stress_today
    return "none" if memories_today.empty?
    stressed_today = memories_today.count {|x| x.stress == "stressed"}
    chill_today = memories_today.count {|x| x.stress == "chill"}

    chill_today >= stressed_today ? "chill" : "stressed"
  end

  def explanations_today
    memories_today.map do |memory| 
      if memory.explanation.nil? or memory.explanation.strip.empty?
        nil
      else
        memory.explanation.strip
      end
    end.compact
  end
end
