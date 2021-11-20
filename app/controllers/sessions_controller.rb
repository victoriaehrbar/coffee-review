class SessionsController < ApplicationController

    def welcome
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def new
    end

    def create
        User.find_by(username :params[:user][:username])
        # if @user && @user.authenticate(password: params[:user][:password])

        if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.user_id
            redirect_to user_path(@user)
        else
            flash[:error] = "Incorrect login info"
            redirect_to login_path
        end
    end


def omniauth
    @user = User.create_by_google_omniauth(auth)

    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  private

    def auth
      request.env['omniauth.auth']
    end
end