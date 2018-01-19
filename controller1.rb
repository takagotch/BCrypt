class ApplicationControleler < ActionController::Base
  before_filter :authorize

  def authorize
    return redirect_to :conroller => 'signin', :action => 'index' unless session[:user_id]
  end

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] if session[:user_id]
  end

  helper_method :current_user
end

