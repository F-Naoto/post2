class ApplicationController < ActionController::Base
include SessionsHelper

def logged_in_user
unless current_user
flash[:danger]='ログインしてください。'
redirect_to root_path
end
end
end
