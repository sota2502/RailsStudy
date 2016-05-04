class CommentsController < ApplicationController
  before_action :set_mythread, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /mythreads/:mythread_id/comments/new
  def new
    @comment = Comment.new
  end

  # GET /mythreads/:mythread_id/comments/1/edit
  def edit
  end

  # POST /mythreads/:mythread_id/comments
  # POST /mythreads/:mythread_id/comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @mythread, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mythreads/:mythread_id/comments/1
  # PATCH/PUT /mythreads/:mythread_id/comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @mythread, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mythreads/:mythread_id/comments/1
  # DELETE /mythreads/:mythread_id/comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @mythread, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_mythread
      @mythread = Mythread.find(params[:mythread_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_own_comment
      @comment = Comment.find_by(id: params[:id], user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params[:comment][:user_id] = current_user.id
      params[:comment][:mythread_id] = params[:mythread_id]
      params.require(:comment).permit(:body, :user_id, :mythread_id)
    end
end
