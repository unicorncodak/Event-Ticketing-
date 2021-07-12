class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!, only: %i[ show edit update destroy dashboard ]
!
  # GET /events or /events.json
  def index
    @events = Event.where(user_id: session["user_id"])
  end

  # GET /events/1 or /events/1.json
  def show
    @category = Event.get_category(@event.category_id)
  end

  # GET /events/new
  def new
    @event = Event.new
    @category = get_categories
  end

  # GET /events/1/edit
  def edit
  end

  def dashboard
    @events = Event.where(user_id: session["user_id"])
  end
  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = session["user_id"]
    if Date.parse(@event.start_date) > Date.parse( @event.end_date )
      return redirect_to new_event_path, notice: "End Date must be later than start date"
    end
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
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
        format.html { redirect_to @event, notice: "Event was successfully updated." }
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
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
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
      params.require(:event).permit(:name, :description, :location, :category_id, :user_id, :start_date, :end_date, :start_time, :end_time, :paid, :amount)
    end

    def get_categories
      @category = Category.all
      @cat_names = Array.new
      @category.each do |p|
        name = Array.new
        name << p.title 
        name << p.id 
        @cat_names<<name
      end
    end
end
