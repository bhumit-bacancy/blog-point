class EventsController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :register, :register1]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :delete]

  def show
  end

  def index
      @events = Event.paginate(page: params[:page], per_page: 5)
  end

  def new
      @event = Event.new
  end

  def edit
  end

  def create
      @event = Event.new(event_params)
      #@event.user=current_user
      if @event.save
          flash[:notice] = "Event was added successfully."
          redirect_to @event
      else
          render 'new'
      end
  end

  def register
  end

  def register1
    total = @event.price * params[:event][:tikits].to_i
    render json: total
  end

  # def update
  #     if @article.update(art_params)
  #         flash[:notice] = "Atrical was updated successfully."
  #         redirect_to @article
  #     else
  #         render 'edit'
  #     end
  # end
  
  # def destroy
  #     @article.destroy
  #     #@art.save
  #     redirect_to articles_path
  # end

  private
  def set_event
      @event = Event.find(params[:id])
  end

  def event_params
      params.require(:event).permit(:title, :description, :date, :time, :venue, :city, :price)
  end

  def require_same_user
      if current_user != @event.user && !current_user.admin?
          flash[:alert] = "you can only edit/delete your articles"
          redirect_to @event
      end
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
        flash[:alert] = "you are not admin"
        redirect_to categories_path
    end
  end

end
