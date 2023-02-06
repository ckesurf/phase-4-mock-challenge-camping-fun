class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  

  def index 
    campers = Camper.all
    render json: campers
  end

  def create 
    camper = Camper.create!(camper_params)
    render json: camper, status: :created 
  end

  def show
    camper = Camper.find(params[:id])
    render json: camper, serializer: CamperWithActivitiesSerializer

    # camper = Camper.find_by(id: params[:id])

    # if camper
    #   render json: camper
    # else
    #   render json: { error: "Camper not found" }, status: :not_found
    # end

  end

  private 

  def camper_params
    params.permit(:name, :age)
  end

  def render_not_found
    render json: { error: "Camper not found" }, status: :not_found
  end
  



end
