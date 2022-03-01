class AdminController < ApplicationController
  before_action :check_if_admin
  def users_count
    @users_count = User.count
    render layout: 'admin'
  end
end
