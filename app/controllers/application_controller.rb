class ApplicationController < ActionController::API
    before_action :set_current_user
  
  def set_current_user
  
    #現在ログイン中のユーザーをsession[:user_id]で取得する。
    @current_user = User.find_by(id: session[:user_id])
    
  end
end
