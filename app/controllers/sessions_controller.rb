class SessionsController < ApplicationController
  
  
  def new
  end
  
  def create
  user = User.find_by_email(params[:session][:email])
  if user && user.authenticate(params[:session][:password])
  log_in user
   params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  remember user
  flash[:success]= 'ログインに成功しました。'
  redirect_to user
  else
  flash[:danger]= 'ログインに失敗しました。'
  render 'new'
  end
  end
  
  def destroy
  log_out if logged_in?
  flash[:danger]= 'ログアウトしました。'
  redirect_to root_url
  end
  

end
