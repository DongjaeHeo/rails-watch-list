class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query][:title]
      @movies = Movie.where("title ILIKE ?", "%#{@query}%")
    else
      @movies = Movie.all
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to root_path(@movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to root_path(@movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy

    redirect_to root_path, status: :see_other
  end



  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
