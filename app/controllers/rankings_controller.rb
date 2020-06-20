class RankingsController < ApplicationController
  def index
  @rankings = Ranking.group(:user_id).order('count(user_id) desc')
  @user_ranking = current_user.rankings.count 
  end
  
  def create
  # done1 = Ranking.find_by(user_id:101)　条件分岐は効いている。しかし、quiz_idがうまくいかない。
  # done2 = Ranking.find_by(quiz_id:1)
  # if done1 && done2

  correct_numbers = current_user.rankings.where(correct:1).count
  ranking = Ranking.new(user_id: current_user.id, correct:params[:correct], total_correct:correct_numbers, quiz_id:1) #quiz_idはおかしいけど、仮
  ranking.save
  end

  
  private
  def ranking_params
  params.require(:ranking).permit(:user_id, :correct)
  end
end

