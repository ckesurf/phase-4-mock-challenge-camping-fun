class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  # /campers
  def index
    render json: Camper.all
  end

  # /campers/1
  def show
    camper = Camper.find(params[:id])
    # render json: camper, include: :activities
    render json: camper, serializer: CamperWithActivitiesSerializer
  end

  # /campers
  def create
    # strong params
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  end

  private

  def camper_params
    params.permit(:name, :age)
  end

  def render_not_found
    render json: { error: "Camper not found" }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
