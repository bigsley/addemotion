class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email, :on => :create
  has_many :memories

  def memoriesToday
    return @memoriesToday if @memoriesToday
    @memoriesToday = self.memories.where("created_at > ?", DateTime.now.beginning_of_day).all
  end

  def moodToday
    return "none" if memoriesToday.empty?
    happyToday = memoriesToday.count {|x| x.mood == "happy"}
    sadToday = memoriesToday.count {|x| x.mood == "sad"}

    happyToday >= sadToday ? "happy" : "sad"
  end

  def stressToday
    return "none" if memoriesToday.empty?
    stressedToday = memoriesToday.count {|x| x.stress == "stressed"}
    chillToday = memoriesToday.count {|x| x.stress == "chill"}

    chillToday >= stressedToday ? "chill" : "stressed"
  end
end
