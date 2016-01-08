class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by_email(params[:session][:email])

    respond_to do |format|
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        format.html { redirect_to '/' }
      else
        format.html { render :new }
        #redirect_to '/login'
      end
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
