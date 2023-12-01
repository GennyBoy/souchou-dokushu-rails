class ApplicationController < ActionController::Base
  # USERS = { "admin_user" => "admin_password" }
  # before_action :authenticate
  before_action :set_locale
  before_action :logged_in
  helper_method :current_user

  private
    # ログイン機能実装の為コメントアウト
    # def authenticate
    #   authenticate_or_request_with_http_digest do |username|
    #     USERS[username]
    #   end
    # end

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def logged_in
      unless session[:user_id]
        redirect_to new_auths_path
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id])
    end
end
