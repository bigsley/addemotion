class SessionsController < ApplicationController
  respond_to :json

  def create
    user = User.find_by_email(params[:email])
    session[:user_id] = user.id

    if user && user.authenticate(params[:password])
      render json: {}
    else
      respond_to do |format|
        format.json { render :json => [], :status => :unauthorized }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {}
  end
end
