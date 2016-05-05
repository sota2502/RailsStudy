class MythreadsController < ApplicationController
  before_action :set_mythread, only: [:show]
  before_action :set_own_mythread, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /mythreads
  # GET /mythreads.json
  def index
    @mythreads = Mythread.all
  end

  # GET /mythreads/1
  # GET /mythreads/1.json
  def show
    @comments = Comment.where(mythread_id: params[:id])
    @comment  = Comment.new
    @bookmark = Bookmark.find_by(user_id: current_user.id, mythread_id: params[:id])
    @follow   = Follow.find_by(user_id: current_user.id, followed_id: @mythread.user.id)
  end

  # GET /mythreads/new
  def new
    @mythread = Mythread.new
  end

  # GET /mythreads/1/edit
  def edit
  end

  # POST /mythreads
  # POST /mythreads.json
  def create
    @mythread = Mythread.new(mythread_params)

    PostMailer.post_email(current_user, @mythread).deliver

    respond_to do |format|
      if @mythread.save
        format.html { redirect_to @mythread, notice: 'Mythread was successfully created.' }
        format.json { render :show, status: :created, location: @mythread }
      else
        format.html { render :new }
        format.json { render json: @mythread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mythreads/1
  # PATCH/PUT /mythreads/1.json
  def update
    respond_to do |format|
      if @mythread.update(mythread_params)
        format.html { redirect_to @mythread, notice: 'Mythread was successfully updated.' }
        format.json { render :show, status: :ok, location: @mythread }
      else
        format.html { render :edit }
        format.json { render json: @mythread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mythreads/1
  # DELETE /mythreads/1.json
  def destroy
    @mythread.destroy
    respond_to do |format|
      format.html { redirect_to mythreads_url, notice: 'Mythread was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mythread
      @mythread = Mythread.find(params[:id])
    end

    def set_own_mythread
      @mythread = Mythread.find_by(id: params[:id], user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mythread_params
      params.require(:mythread).permit(:title, :body).merge({user_id: current_user.id})
    end
end
