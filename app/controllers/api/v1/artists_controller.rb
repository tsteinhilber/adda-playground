module Api::V1

class Api::V1::ArtistsController < ApiController
  before_action :set_artist, only: [:edit, :destroy]

  # GET /artists
  # GET /artists.json
  def index
    render json: Artist.search(params[:search])
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    list = Artist.find_by_slug(params[:id])
    render json: list
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists.json
  def create
    artist = Artist.new(artist_params)
    if artist.save
      render status: 200, json:{
          message: "Successfully created Artist",
          artist: artist
      }.to_json
    else
      render status: 422, json:{
          errors: artist.errors
      }.to_json
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    artist = Artist.find_by_slug(params[:id])
    if artist.update(artist_params)
      render json: {
          status: 200,
          message: "Successfully updated",
          artist: @artist
      }.to_json
    else
      render json: {
          status: 500,
          message: "Artist could not be updated",
          artist: artist
      }.to_json
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find_by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name_first, :name_last, :email, :website, :category, :status, :date_start)
    end
end

end