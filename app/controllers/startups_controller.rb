class StartupsController < ApplicationController
  before_action :set_startup, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @startups = Startup.all
    respond_with(@startups)
  end

  def show
    respond_with(@startup)
  end

  def new
    @startup = Startup.new
    respond_with(@startup)
  end

  def edit
  end

  def create
    @startup = Startup.new(startup_params)
    @startup.save
    respond_with(@startup)
  end

  def update
    @startup.update(startup_params)
    respond_with(@startup)
  end

  def destroy
    @startup.destroy
    respond_with(@startup)
  end

  private
    def set_startup
      @startup = Startup.find(params[:id])
    end

    def startup_params
      params.require(:startup).permit(:name, :url)
    end
end
