class RankingsController < ApplicationController
  def index
  end
  
  def create
  Ranking.create(correct:params[:correct])
  end
  
  private
  def ranking_params
  params.require(:ranking).permit(:correct)
  end
end
