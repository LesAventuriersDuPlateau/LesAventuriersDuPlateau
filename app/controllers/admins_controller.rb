class AdminsController < ApplicationController
  def show
    @events_false = Event.where(is_validate: false)
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(is_validate: true)
      redirect_to admin_path, notice: "L'événement a été mis à jour avec succès."
    else
      flash[:error] = "La mise à jour de l'événement a échoué."
      render :show
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_path(current_user.id)
  end

  private
  
  def event_params
    params.require(:event).permit(:is_validate)
  end
end
