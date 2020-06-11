class HomeController < ApplicationController
  
  def list
  @q = Quiz.ransack(params[:q])
  @quizzes = @q.result(distinct: true)
  end

  def help
  end
  
  def about
  end
  
  def contact
  end

end
