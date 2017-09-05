class PicturesController < ApplicationController
  def index
    @most_recent_pictures = Picture.most_recent_five
  end


  def show
    @picture = Picture.find(params[:id])
  end


  def new
    @picture = Picture.new
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end


  def create
    @picture = Picture.new

        @picture.title = params[:picture][:title]
        @picture.artist = params[:picture][:artist]
        @picture.url = params[:picture][:url]


        if @picture.save
          # if the picture gets saved, generate a get request to "/pictures" (the index)
          redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end
end
