class AlbumsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @band_id = params[:id]
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = 'Succesfully created album!'
      redirect_to album_path(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    album_id = params[:id]
    @album = Album.find_by_id(album_id)
    if @album
      render :show
    else
      flash[:errors] ||= []
      flash[:errors] << "Cannot find album with id #{album_id}"
      redirect_to bands_path
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      flash[:notice] = 'Succesfully updated album!'
    else
      flash[:errors] = @album.errors.full_messages
    end

    redirect_to album_path(@album)
  end

  def destroy
  end

  private

  def album_params
    params.require(:album).permit(:title, :kind, :band_id)
  end
end
