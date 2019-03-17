class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = a_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = a_song
  end

  def update
    @song = a_song
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = a_song
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def a_song
    Song.find(params[:id])
  end

end
