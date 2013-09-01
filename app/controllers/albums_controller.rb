class AlbumsController < ApplicationController
  before_filter :authorize

  def new
    @title = 'New album'
    @album = current_user.albums.build
  end

  def create
    params.permit!
    @album = current_user.albums.build(params[:album])
    if @album.save
      redirect_to library_path
    else
      render 'albums/new'
    end
  end

  private
    def user_params
      params.require(:album).permit(:caption, :description)
    end
end
