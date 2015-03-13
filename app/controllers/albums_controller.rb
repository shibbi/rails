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

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      flash[:notice] = 'Succesfully updated album!'
      redirect_to album_path(@album)
    else
      flash[:errors] = @album.errors.full_messages
      edit
    end
  end

  def destroy
    album_id = params[:id]
    album = Album.find(album_id)
    if Album.destroy(album)
      flash[:notice] = "Successfully deleted album #{album.title}"
      redirect_to band_path(album.band)
    else
      flash[:errors] ||= []
      flash[:errors] << "Cannot find album with id #{album_id}"
      redirect_to bands_path
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :kind, :band_id)
  end
end
