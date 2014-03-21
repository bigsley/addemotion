class MyDataController < ApplicationController
  respond_to :json

  def show
    render json: {
      memoriesToday: current_user.memories_today.count,
      moodToday: current_user.mood_today,
      stressToday: current_user.stress_today,
      explanationsToday: current_user.explanations_today
    }
  end
end
