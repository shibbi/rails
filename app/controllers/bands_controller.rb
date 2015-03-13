class BandsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:notice] = 'Succesfully created band!'
      redirect_to band_path(@band)
    else
      flash[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def show
    band_id = params[:id]
    @band = Band.find_by_id(band_id)
    if @band
      render :show
    else
      flash[:errors] ||= []
      flash[:errors] << "Cannot find band with id #{band_id}"
      redirect_to bands_path
    end
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      flash[:notice] = 'Succesfully updated band!'
    else
      flash[:errors] = @band.errors.full_messages
    end

    redirect_to band_path(@band)
  end

  def destroy
    band = Band.find(params[:id])
    if Band.destroy(band)
      flash[:notice] = "Successfully deleted band #{band.name}"
    else
      flash[:errors] ||= []
      flash[:errors] << "Cannot find band with id #{band_id}"
    end

    redirect_to bands_path
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
