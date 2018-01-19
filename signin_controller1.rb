class SinginController < ApplicationController
  skip_filer :authorize, :except=>:index

  def index
    flash[:message]
  end

  def signin
    user = User.find_by name: params[:login]
    unless user && user.authentivate(params[:password])
      flash[:message] = "fail password authentication"
      return redirect_to action: 'index'
    end

    session[:user_id] = user.id
    redirect_to controller: 'user', action: 'list'
  end

  def signout
    session[:user_id] = nil
    flash[:message] = "Logout."
    redirect_to :controller => 'signin', :action => 'index'
  end
end

