class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /api/v1/users
  def index
    @users = User.all
    render json: UserSerializer.new(@users).serializable_hash[:data].map { |entry| entry[:attributes] }, status: :ok
  end

  # GET /api/v1/users/1
  def show
    render json: @user, serializer: UserSerializer, status: :ok
  end

  # POST /api/v1/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, serializer: UserSerializer, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @user.update(user_params)
      render json: @user, serializer: UserSerializer, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    if @user.destroy
      render json: { message: 'User deleted' }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(%i[name email password password_confirmation])
  end
end
