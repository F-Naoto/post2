class QuizzesController < ApplicationController
  before_action:correct_user, only:[:destroy]
  before_action:same_user, only:[:show]
  
  def index
  @feed_items = current_user.feed
  @q = Quiz.ransack(params[:q])
  @quizzes = @q.result(distinct: true)
  end
  
  def show
  if logged_in?
  @quizzes = current_user.quizzes
  @quiz_count = current_user.quizzes.where(user_id:params[:id]).count
  @quiz = current_user.quizzes.build 
  end
  end
  
  
  def create
  @quiz = current_user.quizzes.build(quiz_params)
  if @quiz.save
  flash[:success]='クイズの投稿に成功しました。'
  redirect_to  quiz_path(current_user)
  else
  flash[:danger]='クイズの投稿に失敗しました。'
  #renderにするとnilerrorが発生する。
  redirect_to quiz_path(current_user)
  end
  end
  
  def edit
  end

  def destroy
  @quiz.destroy 
  flash[:success] = "Micropost deleted"
  redirect_to current_user
  end
  
  private
def quiz_params
params.require(:quiz).permit(:question, :choice_1, :choice_2, :choice_3, :choice_4, :answer, :genre)
end

  def correct_user
     @quiz = current_user.quizzes.find_by(id:params[:id])
     redirect_to root_url if @quiz.nil?
  end
  
      # 正しいユーザーかどうかを確認
  def same_user
    @user = User.find(params[:id])      
    redirect_to(root_url) unless current_user?(@user)
  end


end

