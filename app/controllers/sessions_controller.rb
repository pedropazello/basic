class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:session][:email])

    respond_to do |format|
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        flash[:success] = t('flash.sucess.valid_login')
        format.html { redirect_to '/' }
      else
        flash[:danger] = t('flash.danger.invalid_login')
        format.html { render :new }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
