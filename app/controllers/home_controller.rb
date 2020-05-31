class HomeController < ApplicationController
  
  def list
  @users = current_user.following
  end

  def help
  end
  
  def about
  end
  
  def contact
  end

end
