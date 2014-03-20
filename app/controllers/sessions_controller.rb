class SessionsController < ApplicationController
  respond_to :json

  def create
    user = User.find_by_email(params[:email])
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
    redirect_to root_url, :notice => "Logged out!"
  end
end
