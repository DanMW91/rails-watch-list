require 'json'
require 'open-uri'

class MoviesController < ApplicationController
  def search
    query = params[:search][:query]
    movies = fetch_movies(query)
    # raise
    list_id = params[:search][:list_id]

    redirect_to list_path(list_id, movies: movies)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url)
  end

  def fetch_movies(user_query)
    query = user_query.split(' ').join('+')
    url = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['OMDB_API_KEY']}&query=#{query}"
    search_results = URI.open(url).read
    results = JSON.parse(search_results)
    results['results'][0..4]
  end
end
