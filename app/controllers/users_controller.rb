class UsersController < ApplicationController
    before_action :authorize, only: [:show, :update]
    def index
        render json: User.all
    end
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def show
        user = User.find(session[:user_id])
        render json: user
    end

    def update
        user = User.find(session[:user_id])
        user.update!(user_params)
        render json: user, status: :accepted
    end
    private
    def user_params
        params.permit(:username, :password, :password_confirmation, :bio, :image_url)
    end

    def authorize
        return render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :user_id
    end
end
