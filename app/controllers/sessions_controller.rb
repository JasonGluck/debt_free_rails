class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to app_path
    else 
      flash.now[:error] = "Invalid email and/or password"
      render :new
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end

end
