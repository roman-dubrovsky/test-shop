class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_to_root_path_if_not_admin

  layout 'admin'

  def root
    redirect_to admin_orders_path
  end

  private

    def redirect_to_root_path_if_not_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end
end
