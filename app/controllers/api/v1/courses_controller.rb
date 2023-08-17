class Api::V1::CoursesController < ApplicationController
  before_action :set_course, only: %i[ show update destroy ]

  # GET /api/v1/courses
  def index
    courses = Course.all
    render json: courses, status: 200
  end

  # GET /api/v1/courses/1
  def show
    render json: @course
  end

  # POST /api/v1/courses
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created
    else
      render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/courses/1
  def destroy
    if @course.destroy
      render json: { message: 'Course deleted' }, status: :ok
    else
      render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_course
    begin
      @course = Course.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Course not found' }, status: :not_found
    end
  end  

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit([:name,:description, :photo, :price, :teacher])
  end
end
