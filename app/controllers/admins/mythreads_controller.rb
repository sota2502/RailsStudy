class Admins::MythreadsController < Admins::BaseController
  before_action :set_mythread, only: [:destroy]

  def index
    @mythreads = Mythread.all
  end

  def destroy
    @mythread.destroy
    respond_to do |format|
      format.html { redirect_to admins_mythreads_url, notice: 'Mythread was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_mythread
      @mythread = Mythread.find(params[:id])
    end

end
