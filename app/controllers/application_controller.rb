class ApplicationController < ActionController::Base
  
  # devise機能が使われる前にconfigure_permitted_parametersが実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  # nameのデータ操作を許可
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
