class AlbumsController < ApplicationController
  before_filter :authorize

  def show
    @album = Album.find(params[:id])
    @title = "#{@album.caption}"
  end

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
  
  def edit
    @album = Album.find(params[:id])
    @title = "Edit #{@album.caption}"
  end

  def update
    params.permit!
    album = Album.find(params[:id])
    if album.update_attributes(params[:album])
      flash[:success] = 'Album has been successfully updated.'
      redirect_to album
    else
      render 'albums/edit'
    end
  end

  def destroy
    
  end

  private
    def user_params
      params.require(:album).permit(:caption, :description)
    end
end
