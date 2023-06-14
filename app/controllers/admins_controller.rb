class AdminsController < ApplicationController
  def show
    @events_false = Event.where(is_validate: false)
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to root_path, notice: "L'événement a été mis à jour avec succès."
    else
      flash[:error] = "La mise à jour de l'événement a échoué."
      render :show
    end
  end
  
  private
  
  def event_params
    params.require(:event).permit(:is_validate)
  end
end
