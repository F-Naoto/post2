class MicropostsController < ApplicationController
before_action:logged_in_user, only:[:create, :destroy]
before_action :correct_user,   only: :destroy
  
def create
@micropost = current_user.microposts.build(micropost_params)
if @micropost.save
flash[:success]='投稿しました。'
redirect_to  current_user
else
flash[:danger]='投稿に失敗しました。'
#renderにするとnilerrorが発生する。
redirect_to current_user
end
end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to current_user
  end




private
def micropost_params
params.require(:micropost).permit(:content)
end

  def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
  end
end

