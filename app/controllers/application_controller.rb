class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
<<<<<<< HEAD
      username == 'kato' && password == 'techcamp'
=======
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
>>>>>>> 1d173eca452cc699645985d6aae3cfcbfc0cc6bc
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :kanji_first_name, :kanji_last_name, :kana_first_name, :kana_last_name, :birthday])
  end
  
end
