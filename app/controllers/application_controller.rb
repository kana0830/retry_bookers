class ApplicationController < ActionController::Base
  
  # devise機能が使われる前にconfigure_permitted_parametersが実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_user

  def after_sign_in_path_for(resource)
    user_path(resource) # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    new_user_session_path  # ログアウト後に遷移するpathを設定
  end

  # nameのデータ操作を許可
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name,])
  end
end
