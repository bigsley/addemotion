class UsersController < ApplicationController
  respond_to :json

  def create
    # might use pc later but for now create simple forms
    params[:password_confirmation] = params[:password]

    user = User.new user_params

    if user.save
      session[:user_id] = user.id
      render json: {}
    else
      respond_to do |format|
        format.json { render :json => [], :status => :unauthorized }
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
