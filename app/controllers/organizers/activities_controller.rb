class Organizers::ActivitiesController < ApplicationController
  before_action :set_organizer, only: [ :index ]
  before_action :set_activity, only: [ :edit, :update ]
  
  def index
  end

  def edit
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
          format.html { redirect_to :organizer_activity, notice: 'Activity was successfully updated.' }
      else
          format.html { redirect_to :organizer_activity, notice: 'Failed!' }
      end
    end
  end


  private
    def set_organizer
      @organizer = Organizer.find(params[:organizer_id])
    end

    def set_activity
      @activity = Activity.find(params[:activity_id])
    end

    def activity_params
      params.require(:activity).permit(:name, :email, :phone, :address, :img_url, :description, :avatar, :avatar_cache, :remove_avatar)
    end

end
