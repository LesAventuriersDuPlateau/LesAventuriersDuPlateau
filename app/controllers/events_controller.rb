class EventsController < ApplicationController
  include EventsHelper
  before_action :save_events_in_cart
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :check_event_validation, only: %i[ edit show ]


  # GET /events or /events.json
  def index
    @events = Event.all
    @order = Order.new
    @events_true = Event.where(is_validate: true)
    @events_carrousel = Event.where(is_validate: true).order(created_at: :desc).limit(7)
  end

  # GET /events/1 or /events/1.json
  def show
    @event = Event.find(params[:id])
    @order = Order.new
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events or /events.json
  def create
    all_params_event = event_params.merge(user: current_user)
    @event = Event.new(all_params_event)

    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: "Evénement créé avec succès" }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Evénement mis à jour" }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Evénement supprimé" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :description, :price, :image_url, :city, :zip_code, :start_date, :duration, :is_validate)
    end

    def check_event_validation
      @event = Event.find(params[:id])
      
      if !@event.is_validate
        flash[:error] = "Cet événement ne peut pas être modifié."
        redirect_to root_path
      end
    end

end
