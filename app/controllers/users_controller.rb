class UsersController < ApplicationController
    before_action :authorized, only: [:show, :update]
    def index
        render json: User.all
    end
    def create
        user = User.create!(user_params)
        if user.valid?
            token = encode_token(user_id: user.id)
            render json: {user: user, jwt: token}, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        user_id = decoded_token[0]['user_id']
        user = User.find(user_id)
        render json: user
    end

    def update
        user_id = decoded_token[0]['user_id']
        user = User.find(user_id)
        user.update!(user_params)
        render json: user, status: :accepted
    end

    def destroy
        user_id = decoded_token[0]['user_id']
        user = User.find(user_id)
        user.destroy
        head :no_content
    end
    private
    def user_params
        params.permit(:username, :password, :password_confirmation, :bio, :image_url)
    end
end
