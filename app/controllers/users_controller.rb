class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create 
        new_user = User.new(user_params)
        if new_user.save
            token = encode_token(user_id: new_user.id)
            render json: { user: UserSerializer.new(new_user), jwt: token }, status: :created
        else 
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end 
    end 

    def show 
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end 

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end
end
