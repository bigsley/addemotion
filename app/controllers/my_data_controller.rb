class MyDataController < ApplicationController
  respond_to :json

  def show
    render json: {
      memoriesToday: current_user.memoriesToday.count,
      moodToday: current_user.moodToday,
      stressToday: current_user.stressToday
    }
  end
end
