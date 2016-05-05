class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bookmark, only: [:destroy]
  before_action :set_mythread, only: [:create]

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @mythread, notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @mythread }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to @bookmark, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def set_mythread
      @mythread = Mythread.find(params[:bookmark][:mythread_id])
    end

    def bookmark_params
      params.require(:bookmark).permit(:mythread_id).merge({user_id: current_user.id})
    end
end
