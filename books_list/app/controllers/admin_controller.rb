class AdminController < ApplicationController
  layout 'admin'
  def check_admin
    redirect_to root_url, alert: 'You are not authorized to access this page' unless current_user.try(:admin?)
  end
end
