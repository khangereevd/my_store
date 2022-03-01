class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def render_403
      render file: 'public/403.haml', status: 403
    end

    def render_404
      render file: 'public/404.haml', status: 404
    end

    def check_if_admin
      # render_403 unless params[:admin]
    end
end
