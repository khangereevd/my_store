class AdminController < ApplicationController
  layout 'admin'
  def users_count
    @users_count = User.count
    render layout: 'admin'
  end
end
