class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /api/v1/reservations
  def index
    reservations = Reservation.all
    render json: reservations, status: 200
  end

  # GET /api/v1/reservations/1
  def show
    render json: @reservation
  end

  # POST /api/v1/reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/reservations/1
  def destroy
    if @reservation.destroy
      render json: { message: 'Reservation deleted' }, status: :ok
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Reservation not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(%i[user_id course_id date city])
  end
end
