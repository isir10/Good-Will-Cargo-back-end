class UsersController < ApplicationController
    before_action :authorized, only: [:show, :update]
    def index
        render json: User.all
    end
    def create
        user = User.create!(user_params)
        if user.valid?
            token = encode_token(user_id: user.id)
            render json: {user: UserSerializer.new(user), jwt: token}, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        user = current_user
        render json: user
    end

    def update
        user = current_user
        user.update!(user_params)
        render json: user, status: :accepted
    end

    def destroy
        user = current_user
        user.destroy
        head :no_content
    end
    private
    def user_params
        params.permit(:username, :password, :password_confirmation, :bio, :image_url)
    end
end
