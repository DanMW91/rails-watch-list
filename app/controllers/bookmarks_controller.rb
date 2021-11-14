class BookmarksController < ApplicationController

  def create

    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    movie_params = params[:bookmark][:movie]
    movie = Movie.find_by(title: movie_params['title'])
    if movie.nil?
      movie = Movie.create(title: movie_params['title'], overview: movie_params['overview'], poster_url: movie_params['poster_url'])
    end
    @bookmark.movie = movie
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      @bookmarks = Bookmark.where(list_id: @list.id)
      render 'lists/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

end
