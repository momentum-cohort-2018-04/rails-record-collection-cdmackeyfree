class AlbumController < ApplicationController
  def index
    @album = Album.all
  end

  def new
  end

  def create
    @album = Album.new(params.require(:album).permit(:title, :text))
 
    if @album.save
      redirect_to @album
    else
      render 'new'
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
   
    if @album.update(params.require(:album).permit(:title, :text))
      redirect_to @album
    else
      render 'edit'
    end
  end

  def show
    @album = Album.find(params[:id])
  end
  
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
   
    redirect_to album_path
  end
  
end
