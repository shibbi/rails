class TracksController < ApplicationController
  before_action :redirect_if_not_logged_in

  def create
    @track = Track.new(track_params)
    if @track.save
      flash[:notice] = 'Succesfully created track!'
      redirect_to track_path(@track)
    else
      flash[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    track_id = params[:id]
    @track = Track.find_by_id(track_id)
    if @track
      render :show
    else
      flash[:errors] ||= []
      flash[:errors] << "Cannot find track with id #{track_id}"
      redirect_to :back
    end
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      flash[:notice] = 'Succesfully updated track!'
    else
      flash[:errors] = @track.errors.full_messages
    end

    redirect_to track_path(@track)
  end

  def destroy
  end

  private

  def track_params
    params.require(:track).permit(:title, :kind)
  end
end
