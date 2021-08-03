class DisplaysController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @displays = Display.includes(:user).order("created_at DESC")
  end

  def new
    @display = Display.new
  end

  def create
    @display = Display.new(display_params)
    if @display.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @display = Display.find(params[:id])
  end

  def edit
    @display = Display.find(params[:id])

      unless @display.user_id == current_user.id
        redirect_to root_path
      end
  end

  def update
    @display = Display.find(params[:id])
    if @display.update(display_params)
      redirect_to display_path
    else
      render :edit
    end
  end

  private
  def display_params
    params.require(:display).permit(:display_name, :image, :instruction, :genre_id, :area_id, :day_id, :load_id, :status_id, :price).merge(user_id: current_user.id)
  end

end
