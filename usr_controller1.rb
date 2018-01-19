class UserController < ApplicationController
  def new
    @messages = flash[:message]
    @user = params[:user] || User.new
  end

  def create
    user = User.create do |b|
      b.name = params[:name]
      b.login = params[:login]
      b.email = params[:email]
      b.password = params[:password]
      b.password_confirmation = params[:password_confimation]
    end
    if user.errors.any?
      flash[:messages] = user.errors.full_messages
      return redirect_to :action=>'new'
    end
    redirect_to :action => 'list'
  end

  def list
    @user = User.all
  end
end

