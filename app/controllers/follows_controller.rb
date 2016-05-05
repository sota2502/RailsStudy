class FollowsController < ApplicationController
  # POST /follows/toggle/:id
  def toggle
    follows = Follow.find_by(user_id: current_user.id, followed_id: params[:id])
    if follows
      follows.destroy
    else
      new_follows = Follow.new( user_id: current_user.id, followed_id: params[:id] )
      new_follows.save
    end
    
    render json: { status: 'ok' }
  end
end
