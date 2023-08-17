class BookmarksController < ApplicationController

  def delete
    @bookmark = Boomark.find(params[:id])
    @bookmark = Bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(list_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def list_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
