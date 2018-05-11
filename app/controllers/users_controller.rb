class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
        @user = User.find(session[:user_id])
    end

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            redirect_to new_user_path
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :username, :password, :password_confirmation)
        end
end
