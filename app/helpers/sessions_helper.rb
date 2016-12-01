module SessionsHelper
  def current_user
  # If there's an active session, continue to use what has already been assigned @current_user
  # If there isn't an active session, see if the user has signed up before. If he has, grab their ID from their session and assign it to @current_user
  # If they've never signed in before, @current_user will be `nil`, because there will be no session with a user_id
  @current_user ||= User.find_by(id: session[:user_id])
end

def signed_in?
  # Use the current_user method to determine if the active user has signed in/up before.  If they havenn't, this will return false.
  !current_user.nil?
end

def require_login
  # Uses previously defined methods to check to make sure the active user is signed_in
  # redirect_to signin_path unless signed_in?
  unless signed_in?
    flash.alert = 'Signin required'
    redirect_to signin_path
  end
end

def current_user=(user)
  # enables subsequent methods to be run in sessions_controller w/o using instance var?
  @current_user = user
end

def sign_in(user)
  # Assign a user's ID to their session hash so we remember them in subsequent requests, i.e. signin
  session[:user_id] = user.id
  self.current_user = user
end

def sign_out
  self.current_user = nil
  session.delete(:user_id)
end
end
