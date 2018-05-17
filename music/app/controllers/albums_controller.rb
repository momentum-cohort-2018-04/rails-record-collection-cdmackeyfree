class AlbumsController < ApplicationController
    def index
      @album = Album.all
    end
  
    def new
    end
  
    def create
      @album = Album.new(album_params)
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
     
      if @album.update(album_params)
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
     
      redirect_to albums_path
    end

    private
  def album_params
    params.require(:album).permit(:title, :artist, :year)
  end
    
end
  