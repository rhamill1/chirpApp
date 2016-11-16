class ChirpsController < ApplicationController
  before_action :get_chirp, only: [:destroy, :edit, :update]

  def index
    render :json => Chirp.all, status: 200
  end

  def create
    chirp = Chirp.create(chirp_params)

    if chirp.valid?
      render :json => chirp, status: 201
    else
      head 400
    end
  end

  def edit
    render :json => @chirp, status: 200
  end

  def update
    @chirp.update_attributes(chirp_params)
    if @chirp
      render :json => {success: "chirp updated!"},
      status: 204
    else
      render :json => {error: "not updated!"},
      status: 400
    end
  end

  def destroy
    @chirp.destroy

    if @chirp.destroyed?
      render :json => {success: "chirp elimiated"},
      status: 200
    else
      render :json => {error: "drats, still chirping"},
      status: 400
    end
  end

  private

    def chirp_params
      params.require(:chirp).permit(:chirp)
    end

    def get_chirp
      @chirp = Chirp.find(params[:id])
    end

end
