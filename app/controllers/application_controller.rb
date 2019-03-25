class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	# before_action :authenticate_user!




  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname,:firstname,:lastname_kana,:firstname_kana,:nickname,:address,:postal,:introduction])
  end
end
