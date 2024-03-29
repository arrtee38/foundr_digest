class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[start logout]

  def home; end

  def apply; end

  def start
    @project = current_user.default_project
    return unless @project.title? && @project.description?

    redirect_to dashboard_path, notice: 'You already created your project.'
  end

  def magic_login
    user = User.find_by(auth_code: params[:auth_code])

    if user
      sign_in(user)
      redirect_to start_path
    else
      redirect_to user_session_path, alert: "We couldn't find that user, please log in manually."
    end
  end

  def thanks; end

  def logout
    sign_out(current_user)
    redirect_to root_path
  end

  def page
    @page_key = request.path[1..-1]
    render "pages/#{@page_key}"
  end
end
