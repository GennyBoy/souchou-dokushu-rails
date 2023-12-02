class AuthsController < ApplicationController
  skip_before_action :logged_in, only: %i[ new create ]

  def new
    @auth = Auth.new
  end

  def create
    @auth = Auth.new(auth_params)

    if @auth.valid?
      user = User.find_by(email: params[:auth][:email])
      if user && BCrypt::Password.new(user.password) == params[:auth][:password]
        session[:user_id] = user.id
        redirect_to root_path
      else
        redirect_to new_auths_path
      end
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to new_auths_path
  end

  private
    def auth_params
      params.require(:auth).permit(:email, :password)
    end
end
