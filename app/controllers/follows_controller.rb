class FollowsController < ApplicationController
  # POST /follows/toggle/:id
  def toggle
    follow = find_or_initialized_by(user_id: current_user.id, followed_id: params[:id])

    if follow.new_record?
      status = follow.save ? 'ok' : 'ng'
    else
      status = follow.destroy ? 'ok' : 'ng'
    end
    
    render json: { status: status }
  end
end
