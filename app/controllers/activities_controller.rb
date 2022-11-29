class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  def index
    render json: Activity.all
  end

  def destroy
    # destroy the specified activity
    # begin
    #   activity = Activity.find(params[:id])
    #   activity.destroy
    # rescue ActiveRecord::RecordNotFound
    #   render json: { error: "Activity not found" }, status: :not_found
    # else
    #   # render json: {}, status: :no_content
    #   head :no_content
    
    # end
    
    activity = Activity.find(params[:id])
    activity.destroy
    head :no_content
  end

  private 

  def render_not_found
    render json: { error: "Activity not found" }, status: :not_found
  end

end
