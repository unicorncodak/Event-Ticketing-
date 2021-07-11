class RegistrationsController < ApplicationController
    # instantiates new user
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            # stores saved user id in a session
            session[:user_id] = @user.id
            redirect_to root_path, notice: 'Successfully created account'
        else
            flash.now[:alert] = 'Something went wrong'
            render :new
        end
    end

    private
    def user_params
        # strong parameters
        params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end
end