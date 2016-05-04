class Admins::BaseController < ApplicationController
  before_action :authenticate_admin

  private
    def authenticate_admin
      user = authenticate_user!
      unless user
        redirect_to new_user_session_url
        return
      end

      unless user.admin?
        render :text => "403 Forbidden", :status => 403
        return
      end
    end
end
