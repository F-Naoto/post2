class UsersController < ApplicationController
before_action :logged_in_user, only:[:edit,:update,:destroy,
                                        :following, :followers]
before_action :correct_user,   only: [:edit, :update]
                                      
  def new
  @user = User.new
  end
  
  def create
  @user = User.create(user_params)
  if @user.save
    flash[:success]="アカウント作成に成功しました。"
    redirect_to @user
  else
    flash[:danger]="アカウント作成に失敗しました。"
    render 'new'
  end
  end
  
  def edit
  @user = User.find(params[:id])
  end
  
  
  def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:success]= '編集に成功しました。'
  redirect_to @user
  else
  flash.now[:danger]= '編集に失敗しました。'
  render 'edit'
  end
  end
  
  def show
    @user = User.find(params[:id])
    @users = @user.following
    @microposts = @user.microposts.page(params[:page]) 
    @micropost = current_user.microposts.build if logged_in?
  end
  
  def following
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page])
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render 'show_follow'
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
      # beforeフィルター
      
      # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # 正しいユーザーかどうかを確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうかを確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
