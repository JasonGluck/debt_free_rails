class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      sessions[:user_id] = user.ids
      redirect_to app_path
    


  end
  
  def destroy
  end

end
